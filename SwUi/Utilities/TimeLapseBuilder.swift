//
//  TimeLapseBuilder.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 26.08.2022.
//
// https://github.com/acj/TimeLapseBuilder-Swift

// MARK: -  Create video from images

import AVFoundation

#if os(macOS)
import Cocoa
typealias UIImage = NSImage
#else
import UIKit
#endif

protocol TimelapseBuilderDelegate: AnyObject {
    func timeLapseBuilder(_ timelapseBuilder: TimeLapseBuilder, didMakeProgress progress: Progress)
    func timeLapseBuilder(_ timelapseBuilder: TimeLapseBuilder, didFinishWithURL url: URL)
    func timeLapseBuilder(_ timelapseBuilder: TimeLapseBuilder, didFailWithError error: Error)
}

struct TimeLapseBuilderError {
    static var kFailedToStartAssetWriterError: Error {
        NSError(
            domain: "TimeLapseBuilder", code: 0,
            userInfo: ["description": "AVAssetWriter failed to start writing"]
        )
    }
    static var kFailedToAppendPixelBufferError: Error {
        NSError(
            domain: "TimeLapseBuilder", code: 1,
            userInfo: ["description": "AVAssetWriterInputPixelBufferAdapter failed to append pixel buffer"]
        )
    }
    static var kFailedToDetermineAssetDimensions: Error {
        NSError(
            domain: "TimeLapseBuilder", code: 2,
            userInfo: ["description": "TimelapseBuilder failed to determine the dimensions of the first asset. Does the URL or file path exist?"]
        )
    }
    static var kFailedToProcessAssetPath: Error {
        NSError(
            domain: "TimeLapseBuilder", code: 3,
            userInfo: ["description": "TimelapseBuilder failed to process the asset path. Is it a valid URL or file path?"]
        )
    }
}

struct TimeLapseBuilderConfiguration {
    let frameRate: Int32
    let fileType: AVFileType
    let outputUrl: URL
}

class TimeLapseBuilder {
    var delegate: TimelapseBuilderDelegate?
    
    private var videoWriter: AVAssetWriter?
    
    init() { }
    
    init(delegate: TimelapseBuilderDelegate) {
        self.delegate = delegate
    }
    
    func build(with assetPaths: [String], frameRate: Int32, fileType: AVFileType, toOutputPath: String) {
        // Output video dimensions are inferred from the first image asset
        guard
            let firstAssetPath = assetPaths.first,
            let firstAssetURL = URL(string: firstAssetPath),
            let canvasSize = dimensionsOfImage(url: firstAssetURL),
            canvasSize != CGSize.zero
        else {
            let error: Error = TimeLapseBuilderError.kFailedToDetermineAssetDimensions
            self.delegate?.timeLapseBuilder(self, didFailWithError: error)
            return
        }
        
        
        var error: Error?
        let videoOutputURL = URL(fileURLWithPath: toOutputPath)
        
        do {
            try FileManager.default.removeItem(at: videoOutputURL)
        } catch {}
        
        do {
            try videoWriter = AVAssetWriter(outputURL: videoOutputURL, fileType: fileType)
        } catch let writerError as NSError {
            error = writerError
            videoWriter = nil
        }
        
        if let videoWriter = videoWriter {
            let videoSettings: [String : AnyObject] = [
                AVVideoCodecKey  : AVVideoCodecType.h264 as AnyObject,
                AVVideoWidthKey  : canvasSize.width as AnyObject,
                AVVideoHeightKey : canvasSize.height as AnyObject]
            
            let videoWriterInput = AVAssetWriterInput(mediaType: .video, outputSettings: videoSettings)
            
            let sourceBufferAttributes = [
                (kCVPixelBufferPixelFormatTypeKey as String): Int(kCVPixelFormatType_32ARGB),
                (kCVPixelBufferWidthKey as String): Float(canvasSize.width),
                (kCVPixelBufferHeightKey as String): Float(canvasSize.height)] as [String : Any]
            
            let pixelBufferAdaptor = AVAssetWriterInputPixelBufferAdaptor(
                assetWriterInput: videoWriterInput,
                sourcePixelBufferAttributes: sourceBufferAttributes
            )
            
            assert(videoWriter.canAdd(videoWriterInput))
            videoWriter.add(videoWriterInput)
            
            if videoWriter.startWriting() {
                videoWriter.startSession(atSourceTime: CMTime.zero)
                assert(pixelBufferAdaptor.pixelBufferPool != nil)
                
                let media_queue = DispatchQueue(label: "mediaInputQueue")
                
                videoWriterInput.requestMediaDataWhenReady(on: media_queue) {
                    let currentProgress = Progress(totalUnitCount: Int64(assetPaths.count))
                    
                    var frameCount: Int64 = 0
                    var remainingAssetPaths = [String](assetPaths)
                    
                    while !remainingAssetPaths.isEmpty {
                        while videoWriterInput.isReadyForMoreMediaData {
                            if remainingAssetPaths.isEmpty {
                                break
                            }
                            let nextAssetPath = remainingAssetPaths.remove(at: 0)
                            guard let nextAssetURL = URL(string: nextAssetPath) else {
                                error = TimeLapseBuilderError.kFailedToProcessAssetPath
                                break
                            }
                            let presentationTime = CMTimeMake(value: frameCount, timescale: frameRate)
                            
                            if !self.appendPixelBufferForImageAtURL(
                                nextAssetURL,
                                pixelBufferAdaptor: pixelBufferAdaptor,
                                presentationTime: presentationTime
                            ) {
                                error = TimeLapseBuilderError.kFailedToAppendPixelBufferError
                                break
                            }
                            
                            frameCount += 1
                            
                            currentProgress.completedUnitCount = frameCount
                            self.delegate?.timeLapseBuilder(self, didMakeProgress: currentProgress)
                        }
                    }
                    
                    videoWriterInput.markAsFinished()
                    videoWriter.finishWriting {
                        if let error = error {
                            self.delegate?.timeLapseBuilder(self, didFailWithError: error)
                        } else {
                            self.delegate?.timeLapseBuilder(self, didFinishWithURL: videoOutputURL)
                        }
                        
                        self.videoWriter = nil
                    }
                }
            } else {
                error = TimeLapseBuilderError.kFailedToStartAssetWriterError
            }
        }
        
        if let error = error {
            self.delegate?.timeLapseBuilder(self, didFailWithError: error)
        }
    }
    
    // MARK: - CGImages
    public func build(
        with images: [CGImage],
        atFrameRate framesPerSecond: Int32,
        fileType: AVFileType,
        toOutputPath: String
    ) {
        // Output video dimensions are inferred from the first image asset
        guard
            let firstImages = images.first
        else {
            let error: Error = TimeLapseBuilderError.kFailedToDetermineAssetDimensions
            self.delegate?.timeLapseBuilder(self, didFailWithError: error)
            return
        }
        
        let canvasSize = CGSize(width: firstImages.width, height: firstImages.height)
        
        var error: Error?
        let videoOutputURL = URL(fileURLWithPath: toOutputPath)
        
        do {
            try FileManager.default.removeItem(at: videoOutputURL)
        } catch {}
        
        do {
            try videoWriter = AVAssetWriter(outputURL: videoOutputURL, fileType: fileType)
        } catch let writerError as NSError {
            error = writerError
            videoWriter = nil
        }
        
        if let videoWriter = videoWriter {
            let videoSettings: [String : AnyObject] = [
                AVVideoCodecKey  : AVVideoCodecType.h264 as AnyObject,
                AVVideoWidthKey  : canvasSize.width as AnyObject,
                AVVideoHeightKey : canvasSize.height as AnyObject]
            
            let videoWriterInput = AVAssetWriterInput(mediaType: .video, outputSettings: videoSettings)
            
            let sourceBufferAttributes = [
                (kCVPixelBufferPixelFormatTypeKey as String): Int(kCVPixelFormatType_32ARGB),
                (kCVPixelBufferWidthKey as String): Float(canvasSize.width),
                (kCVPixelBufferHeightKey as String): Float(canvasSize.height)] as [String : Any]
            
            let pixelBufferAdaptor = AVAssetWriterInputPixelBufferAdaptor(
                assetWriterInput: videoWriterInput,
                sourcePixelBufferAttributes: sourceBufferAttributes
            )
            
            assert(videoWriter.canAdd(videoWriterInput))
            videoWriter.add(videoWriterInput)
            
            if videoWriter.startWriting() {
                videoWriter.startSession(atSourceTime: CMTime.zero)
                assert(pixelBufferAdaptor.pixelBufferPool != nil)
                
                let media_queue = DispatchQueue(label: "mediaInputQueue")
                
                videoWriterInput.requestMediaDataWhenReady(on: media_queue) {
                    let currentProgress = Progress(totalUnitCount: Int64(images.count))
                    
                    var frameCount: Int64 = 0
                    var remainingImages = images
                    
                    while !remainingImages.isEmpty {
                        while videoWriterInput.isReadyForMoreMediaData {
                            if remainingImages.isEmpty {
                                break
                            }
                            let nextImage = remainingImages.remove(at: 0)
                            
                            let presentationTime = CMTimeMake(value: frameCount, timescale: framesPerSecond)
                            
                            if !self.appendPixelBufferForImage(
                                nextImage,
                                pixelBufferAdaptor: pixelBufferAdaptor,
                                presentationTime: presentationTime
                            ) {
                                error = TimeLapseBuilderError.kFailedToAppendPixelBufferError
                                break
                            }
                            
                            frameCount += 1
                            
                            currentProgress.completedUnitCount = frameCount
                            self.delegate?.timeLapseBuilder(self, didMakeProgress: currentProgress)
                        }
                    }
                    
                    videoWriterInput.markAsFinished()
                    videoWriter.finishWriting {
                        if let error = error {
                            self.delegate?.timeLapseBuilder(self, didFailWithError: error)
                        } else {
                            self.delegate?.timeLapseBuilder(self, didFinishWithURL: videoOutputURL)
                        }
                        
                        self.videoWriter = nil
                    }
                }
            } else {
                error = TimeLapseBuilderError.kFailedToStartAssetWriterError
            }
        }
        
        if let error = error {
            self.delegate?.timeLapseBuilder(self, didFailWithError: error)
        }
    }
    
    // MARK: - CGImages process with completion
    public func build(
        with images: [CGImage],
        configuration config: TimeLapseBuilderConfiguration,
        completion: @escaping (Result<URL, Error>) -> Void
    ) {
        // Output video dimensions are inferred from the first image asset
        guard
            let firstImages = images.first
        else {
            let error: Error = TimeLapseBuilderError.kFailedToDetermineAssetDimensions
            completion(.failure(error))
            return
        }
        
        let canvasSize = CGSize(width: firstImages.width, height: firstImages.height)
        
        var error: Error?
        
        do {
            try FileManager.default.removeItem(at: config.outputUrl)
        } catch {}
        
        do {
            try videoWriter = AVAssetWriter(outputURL: config.outputUrl, fileType: config.fileType)
        } catch let writerError as NSError {
            error = writerError
            videoWriter = nil
        }
        
        if let videoWriter = videoWriter {
            let videoSettings: [String : AnyObject] = [
                AVVideoCodecKey  : AVVideoCodecType.h264 as AnyObject,
                AVVideoWidthKey  : canvasSize.width as AnyObject,
                AVVideoHeightKey : canvasSize.height as AnyObject]
            
            let videoWriterInput = AVAssetWriterInput(mediaType: .video, outputSettings: videoSettings)
            
            let sourceBufferAttributes = [
                (kCVPixelBufferPixelFormatTypeKey as String): Int(kCVPixelFormatType_32ARGB),
                (kCVPixelBufferWidthKey as String): Float(canvasSize.width),
                (kCVPixelBufferHeightKey as String): Float(canvasSize.height)] as [String : Any]
            
            let pixelBufferAdaptor = AVAssetWriterInputPixelBufferAdaptor(
                assetWriterInput: videoWriterInput,
                sourcePixelBufferAttributes: sourceBufferAttributes
            )
            
            assert(videoWriter.canAdd(videoWriterInput))
            videoWriter.add(videoWriterInput)
            
            if videoWriter.startWriting() {
                videoWriter.startSession(atSourceTime: CMTime.zero)
                assert(pixelBufferAdaptor.pixelBufferPool != nil)
                
                let media_queue = DispatchQueue(label: "mediaInputQueue")
                
                videoWriterInput.requestMediaDataWhenReady(on: media_queue) {
                    var frameCount: Int64 = 0
                    var remainingImages = images
                    
                    while !remainingImages.isEmpty {
                        while videoWriterInput.isReadyForMoreMediaData {
                            if remainingImages.isEmpty {
                                break
                            }
                            let nextImage = remainingImages.remove(at: 0)
                            
                            let presentationTime = CMTimeMake(value: frameCount, timescale: config.frameRate)
                            
                            if !self.appendPixelBufferForImage(nextImage, pixelBufferAdaptor: pixelBufferAdaptor, presentationTime: presentationTime) {
                                error = TimeLapseBuilderError.kFailedToAppendPixelBufferError
                                break
                            }
                            
                            frameCount += 1
                        }
                    }
                    
                    videoWriterInput.markAsFinished()
                    videoWriter.finishWriting {
                        if let error = error {
                            completion(.failure(error))
                        } else {
                            completion(.success(config.outputUrl))
                        }
                        
                        self.videoWriter = nil
                    }
                }
            } else {
                error = TimeLapseBuilderError.kFailedToStartAssetWriterError
            }
        }
        
        if let error = error {
            completion(.failure(error))
        }
    }
    
    private func dimensionsOfImage(url: URL) -> CGSize? {
        guard let imageData = try? Data(contentsOf: url),
              let image = UIImage(data: imageData) else {
            return nil
        }
        
        return image.size
    }
    
    private func appendPixelBufferForImageAtURL(
        _ url: URL,
        pixelBufferAdaptor: AVAssetWriterInputPixelBufferAdaptor,
        presentationTime: CMTime
    ) -> Bool {
        var appendSucceeded = false
        
        autoreleasepool {
            if let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData),
               let pixelBufferPool = pixelBufferAdaptor.pixelBufferPool {
                
                let pixelBufferPointer = UnsafeMutablePointer<CVPixelBuffer?>.allocate(capacity: 1)
                let status: CVReturn = CVPixelBufferPoolCreatePixelBuffer(
                    kCFAllocatorDefault,
                    pixelBufferPool,
                    pixelBufferPointer
                )
                
                if let pixelBuffer = pixelBufferPointer.pointee, status == 0 {
                    fillPixelBufferFromImage(image, pixelBuffer: pixelBuffer)
                    
                    appendSucceeded = pixelBufferAdaptor.append(
                        pixelBuffer,
                        withPresentationTime: presentationTime
                    )
                    
                    pixelBufferPointer.deinitialize(count: 1)
                } else {
                    NSLog("error: Failed to allocate pixel buffer from pool")
                }
                
                pixelBufferPointer.deallocate()
            }
        }
        
        return appendSucceeded
    }
    
    private func appendPixelBufferForImage(
        _ image: CGImage,
        pixelBufferAdaptor: AVAssetWriterInputPixelBufferAdaptor,
        presentationTime: CMTime
    ) -> Bool {
        var appendSucceeded = false
        
        autoreleasepool {
            if let pixelBufferPool = pixelBufferAdaptor.pixelBufferPool {
                let pixelBufferPointer = UnsafeMutablePointer<CVPixelBuffer?>.allocate(capacity: 1)
                
                let status: CVReturn = CVPixelBufferPoolCreatePixelBuffer(
                    kCFAllocatorDefault,
                    pixelBufferPool,
                    pixelBufferPointer
                )
                
                if let pixelBuffer = pixelBufferPointer.pointee, status == 0 {
                    fillPixelBufferFromImage(image, pixelBuffer: pixelBuffer)
                    
                    appendSucceeded = pixelBufferAdaptor.append(
                        pixelBuffer,
                        withPresentationTime: presentationTime
                    )
                    
                    pixelBufferPointer.deinitialize(count: 1)
                } else {
                    NSLog("error: Failed to allocate pixel buffer from pool")
                }
                
                pixelBufferPointer.deallocate()
            }
        }
        
        return appendSucceeded
    }
    
    private func fillPixelBufferFromImage(_ image: UIImage, pixelBuffer: CVPixelBuffer) {
        CVPixelBufferLockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
        
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer)
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(
            data: pixelData,
            width: Int(image.size.width),
            height: Int(image.size.height),
            bitsPerComponent: 8,
            bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer),
            space: rgbColorSpace,
            bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue
        )
        
        context?.draw(
            image.cgImage!,
            in: CGRect(
                origin: .zero,
                size: CGSize(width: image.size.width, height: image.size.height)
            )
        )
        
        CVPixelBufferUnlockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
    }
    
    private func fillPixelBufferFromImage(_ image: CGImage, pixelBuffer: CVPixelBuffer) {
        CVPixelBufferLockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
        
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer)
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(
            data: pixelData,
            width: Int(image.width),
            height: Int(image.height),
            bitsPerComponent: 8,
            bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer),
            space: rgbColorSpace,
            bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue
        )
        
        context?.draw(image, in: CGRect(
            origin: .zero,
            size: CGSize(width: image.width, height: image.height)
        ))
        
        CVPixelBufferUnlockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
    }
}

#if os(macOS)
extension NSImage {
    var cgImage: CGImage? {
        var proposedRect = CGRect(origin: .zero, size: size)
        
        return cgImage(forProposedRect: &proposedRect,
                       context: nil,
                       hints: nil)
    }
}
#endif
