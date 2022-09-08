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
}

