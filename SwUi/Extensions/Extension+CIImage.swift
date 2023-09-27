//
//  Extension+CIImage.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 27.09.2023.
//

import CoreImage

#if canImport(AppKit)
import AppKit

extension CIImage {
    var nsImage: NSImage? {
        let context: CIContext = CIContext(options: nil)
        
        guard let cgImage = context.createCGImage(self, from: self.extent) else { return nil }
        
        let image: NSImage = NSImage(cgImage: cgImage, size: cgImage.size)
        return image
    }
}

#endif
