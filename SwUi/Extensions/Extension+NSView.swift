//
//  Extension+NSView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 01.02.2024.
//

#if canImport(AppKit)
import AppKit

extension NSView {
    func debugBorder(color: NSColor = .red, includeSubviews: Bool = true) {
        self.wantsLayer = true
        self.layer?.borderWidth = 1
        self.layer?.borderColor = color.cgColor
        
        if includeSubviews {
            self.subviews.forEach { $0.debugBorder(color: color) }
        }
    }
}
#endif
