//
//  Extension+CGImage.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 07.09.2022.
//

import UIKit
import CoreGraphics

extension CGImage {
    
    var center: CGPoint {
        CGPoint(x: width / 2, y: height / 2)
    }
    
    var size: CGSize {
        CGSize(width: width, height: height)
    }
    
    func overlay(image: CGImage, withShadow: Bool = false) -> CGImage? {
        
        let context = CGContext(
            data: nil,
            width: self.width,
            height: self.height,
            bitsPerComponent: self.bitsPerComponent,
            bytesPerRow: self.bytesPerRow,
            space: self.colorSpace!,
            bitmapInfo: self.bitmapInfo.rawValue
        )
        
        context?.draw(self, in: CGRect(origin: .zero, size: self.size))
        
        let origin: CGPoint = CGPoint(
            x: center.x - image.center.x,
            y: center.y - image.center.y
        )
        
        if withShadow {
            context?.setShadow(offset: .zero, blur: 50)
        }
        
        context?.draw(image, in: CGRect(origin: origin, size: image.size))
        
        return context?.makeImage()
    }
    
    func overlayDots(
        diameter: CGFloat = 20,
        at positions: [CGPoint],
        color: UIColor = .green
    ) -> CGImage? {
        
        let context = CGContext(
            data: nil,
            width: self.width,
            height: self.height,
            bitsPerComponent: self.bitsPerComponent,
            bytesPerRow: self.bytesPerRow,
            space: self.colorSpace!,
            bitmapInfo: self.bitmapInfo.rawValue
        )
        
        context?.draw(self, in: CGRect(origin: .zero, size: self.size))
        
        positions.forEach { position in
            let dot: CGRect = CGRect(
                origin: position,
                size: .equalSize(diameter)
            )
            context?.addEllipse(in: dot)
        }
        
        context?.setFillColor(color.cgColor)
        context?.drawPath(using: .fill)
        
        return context?.makeImage()
    }
    
    func overlayRects(
        _ rects: [CGRect],
        lineWidth: CGFloat = 4,
        color: UIColor = .green
    ) -> CGImage? {
        
        let context = CGContext(
            data: nil,
            width: self.width,
            height: self.height,
            bitsPerComponent: self.bitsPerComponent,
            bytesPerRow: self.bytesPerRow,
            space: self.colorSpace!,
            bitmapInfo: self.bitmapInfo.rawValue
        )
        
        context?.draw(self, in: CGRect(origin: .zero, size: self.size))
        
        // Draw bounding box
        context?.setLineWidth(lineWidth)
        context?.setStrokeColor(color.cgColor)
        
        rects.forEach { context?.stroke($0) }
        
        context?.drawPath(using: .stroke)
        
        return context?.makeImage()
    }
    
    static func emptyImage(size: CGSize, withColor: CGColor? = nil) -> CGImage? {
        
        let context = CGContext(
            data: nil,
            width: Int(size.width),
            height: Int(size.height),
            bitsPerComponent: 8,
            bytesPerRow: (((Int(size.width) * 4) + 15) / 16) * 16,
            space: CGColorSpace(name: CGColorSpace.sRGB)!,
            bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue
        )
        
        context?.saveGState()
        
        if let withColor = withColor {
            context?.setFillColor(withColor)
            context?.fill(CGRect(origin: .zero, size: size))
        }
        
        context?.restoreGState()
        
        return context?.makeImage()
    }
    
    func rotating(to orientation: CGImagePropertyOrientation) -> CGImage? {
        var orientedImage: CGImage?
        
        let originalWidth = self.width
        let originalHeight = self.height
        let bitsPerComponent = self.bitsPerComponent
        let bitmapInfo = self.bitmapInfo
        
        guard let colorSpace = self.colorSpace else {
            return nil
        }
        
        var degreesToRotate: Double
        var swapWidthHeight: Bool
        var mirrored: Bool
        
        switch orientation {
        case .up:
            degreesToRotate = 0.0
            swapWidthHeight = false
            mirrored = false
        case .upMirrored:
            degreesToRotate = 0.0
            swapWidthHeight = false
            mirrored = true
        case .right:
            degreesToRotate = -90.0
            swapWidthHeight = true
            mirrored = false
        case .rightMirrored:
            degreesToRotate = -90.0
            swapWidthHeight = true
            mirrored = true
        case .down:
            degreesToRotate = 180.0
            swapWidthHeight = false
            mirrored = false
        case .downMirrored:
            degreesToRotate = 180.0
            swapWidthHeight = false
            mirrored = true
        case .left:
            degreesToRotate = 90.0
            swapWidthHeight = true
            mirrored = false
        case .leftMirrored:
            degreesToRotate = 90.0
            swapWidthHeight = true
            mirrored = true
            break
        }
        
        let radians = degreesToRotate * Double.pi / 180.0
        
        var width: Int
        var height: Int
        
        if swapWidthHeight {
            width = originalHeight
            height = originalWidth
        } else {
            width = originalWidth
            height = originalHeight
        }
        
        let bytesPerRow = (width * bitsPerPixel) / 8
        
        let contextRef = CGContext(
            data: nil,
            width: width,
            height: height,
            bitsPerComponent: bitsPerComponent,
            bytesPerRow: bytesPerRow,
            space: colorSpace,
            bitmapInfo: bitmapInfo.rawValue)
        
        contextRef?.translateBy(x: CGFloat(width) / 2.0, y: CGFloat(height) / 2.0)
        
        if mirrored {
            contextRef?.scaleBy(x: -1.0, y: 1.0)
        }
        
        contextRef?.rotate(by: CGFloat(radians))
        
        if swapWidthHeight {
            contextRef?.translateBy(x: -CGFloat(height) / 2.0, y: -CGFloat(width) / 2.0)
        } else {
            contextRef?.translateBy(x: -CGFloat(width) / 2.0, y: -CGFloat(height) / 2.0)
        }
        
        contextRef?.draw(self, in: CGRect(origin: .zero, size: .init(width: originalWidth, height: originalHeight)))
        
        orientedImage = contextRef?.makeImage()
        
        return orientedImage
    }
    
    func blur(radius: CGFloat) -> CGImage? {
        
        let ciContext = CIContext(options: nil)
        
        let inputImage = CIImage(cgImage: self)
        
        guard let ciFilter = CIFilter(name: "CIGaussianBlur") else { return nil }
        
        ciFilter.setValue(inputImage, forKey: kCIInputImageKey)
        ciFilter.setValue(radius, forKey: "inputRadius")
        
        guard
            let resultImage = ciFilter.value(forKey: kCIOutputImageKey) as? CIImage,
            let cgImage = ciContext.createCGImage(resultImage, from: inputImage.extent)
        else { return nil }
        
        return cgImage
    }
    
    // One more blur
    /*
     import UIKit
     import CoreImage.CIFilterBuiltins

     let image = UIImage(named: "landscape.jpg")!

     extension UIImage {

         func blur(radius: Float) -> UIImage? {
             let image = CIImage(image: self)
             let blurFilter = CIFilter.gaussianBlur()
             blurFilter.inputImage = image
             blurFilter.radius = radius
             guard let ciImage = blurFilter.outputImage else { return nil }
             return UIImage(ciImage: ciImage)
         }
     }
     */
}

