//
//  Extension+NSImage.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 07.03.2023.
//

import Foundation

#if canImport(AppKit)

extension NSImage {
    
    var cgImage: CGImage? {
        cgImage(forProposedRect: nil, context: nil, hints: nil)
    }
    
    func jpegData(compressionQuality: CGFloat) -> Data? {
        guard let image = cgImage else { return nil }
        let bitmap = NSBitmapImageRep(cgImage: image)
        return bitmap.representation(using: .jpeg, properties: [.compressionFactor: compressionQuality])
    }
    
    @discardableResult
    func write(
        to url: URL,
        format: NSBitmapImageRep.FileType,
        options: Data.WritingOptions = .atomic
    ) -> Bool {
        guard
            let tiffRepresentation = tiffRepresentation,
            let bitmapImage = NSBitmapImageRep(data: tiffRepresentation)
        else { return false }
        
        let data = bitmapImage.representation(using: format, properties: [:])
        
        do {
            try data?.write(to: url, options: options)
            return true
        } catch {
            print(#fileID, #line, "‼️Error: \(error) (\(error.localizedDescription)")
            return false
        }
    }
    
    var data: Data? {
        guard
            let tiffRepresentation = tiffRepresentation,
            let bitmapImage = NSBitmapImageRep(data: tiffRepresentation)
        else { return nil }
        
        return bitmapImage.representation(using: .png, properties: [:])
    }
    
    func tint(color: NSColor) -> NSImage {
        guard
            isTemplate,
            let copiedImage = self.copy() as? NSImage
        else { return self }
        
        copiedImage.lockFocus()
        color.set()
        
        let imageBounds = NSRect(origin: .zero, size: copiedImage.size)
        imageBounds.fill(using: .sourceAtop)
        
        copiedImage.unlockFocus()
        copiedImage.isTemplate = false
        
        return copiedImage
    }
    
    var convertToCGImage: CGImage? {
        var imageRect = CGRect(origin: .zero, size: size)
        
        return self.cgImage(
            forProposedRect: &imageRect,
            context: nil,
            hints: nil
        )
    }
    
    func blurredCGImage(radius: CGFloat, completion: ((CGImage?) -> Void)?) {
        DispatchQueue.global(qos: .background).async {
            
            let ciContext = CIContext(options: nil)
            guard let cgImage = self.convertToCGImage else {
                completion?(nil)
                return
            }
            let inputImage = CIImage(cgImage: cgImage)
            guard let ciFilter = CIFilter(name: "CIGaussianBlur") else {
                completion?(nil)
                return
            }
            ciFilter.setValue(inputImage, forKey: kCIInputImageKey)
            ciFilter.setValue(radius, forKey: "inputRadius")
            
            guard let resultImage = ciFilter.value(forKey: kCIOutputImageKey) as? CIImage else {
                completion?(nil)
                return
            }
            guard let cgImage2 = ciContext.createCGImage(resultImage, from: inputImage.extent) else {
                completion?(nil)
                return
            }
            completion?(cgImage2)
        }
    }
    
    static func imageFromVideo(url: URL, at time: TimeInterval, size: NSSize?) -> NSImage? {
        let asset = AVURLAsset(url: url)
        
        let assetIG = AVAssetImageGenerator(asset: asset)
        assetIG.appliesPreferredTrackTransform = true
        assetIG.apertureMode = AVAssetImageGenerator.ApertureMode.encodedPixels
        
        let cmTime = CMTime(seconds: time, preferredTimescale: 60)
        let thumbnailImageRef: CGImage
        do {
            thumbnailImageRef = try assetIG.copyCGImage(at: cmTime, actualTime: nil)
        } catch let error {
            Log("Error: \(error)", state: .error)
            return nil
        }
        
        let originalSize = CGSize(width: thumbnailImageRef.width, height: thumbnailImageRef.height)
        
        return NSImage(cgImage: thumbnailImageRef, size: size ?? originalSize)
    }
    
    func resize(width: Int, height: Int) -> NSImage {
        let destSize = NSSize(width: width, height: height)
        let newImage = NSImage(size: destSize)
        newImage.lockFocus()
        
        self.draw(
            in: .init(origin: .zero, size: destSize),
            from: .init(origin: .zero, size: self.size),
            operation: .sourceOver, fraction: 1
        )
        
        newImage.unlockFocus()
        newImage.size = destSize
        
        return NSImage(data: newImage.tiffRepresentation!)!
    }
    
    func crop(to rect: CGRect) -> NSImage {
        let cgImage = self.cgImage
        
        if let croppedImage = cgImage?.cropping(to: rect) {
            return NSImage(cgImage: croppedImage, size: rect.size)
        }
        
        return self
    }
    
    func resizeToFit(size targetSize: CGSize) -> NSImage {
        let newSize = self.size.scaleToFit(to: targetSize)
        let newImage = NSImage(size: newSize)
        newImage.lockFocus()
        
        self.draw(
            in: .init(origin: .zero, size: newSize),
            from: .init(origin: .zero, size: self.size),
            operation: .sourceOver, fraction: 1
        )
        
        newImage.unlockFocus()
        newImage.size = newSize
        
        return NSImage(data: newImage.tiffRepresentation!)!
    }
}

#endif
