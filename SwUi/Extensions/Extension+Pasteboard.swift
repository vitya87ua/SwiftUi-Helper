//
//  Extension+Pasteboard.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 28.02.2023.
//

import Foundation

// Allow copy and read image to/from pasteboard

#if canImport(AppKit)
import AppKit

/**
 This typealias bridges platform-specific fonts, to simplify
 multi-platform support.
 */
public typealias ImageRepresentable = NSImage
#endif

#if canImport(UIKit)
import UIKit

/**
 This typealias bridges platform-specific fonts, to simplify
 multi-platform support.
 */
public typealias ImageRepresentable = UIImage
#endif


/**
 This protocol can be implemented any types that can provide
 images from the pasteboard.

 The protocol is implemented by the UIKit `UIPasteboard`, as
 well as the AppKit `NSPasteboard`.
 */
public protocol PasteboardImageReader {

    /**
     Get the first image in the pasteboard, if any.
     */
    var image: ImageRepresentable? { get }

    /**
     Get all images in the pasteboard.
     */
    var images: [ImageRepresentable]? { get }
}

public extension PasteboardImageReader {

    /**
     Check whether or not the pasteboard contains any images.
     */
    var hasImages: Bool {
        guard let images = images else { return false }
        return !images.isEmpty
    }
}

#if os(iOS)
import UIKit

extension UIPasteboard: PasteboardImageReader {}
#endif

#if os(macOS)
import AppKit

extension NSPasteboard: PasteboardImageReader {}

public extension NSPasteboard {

    /**
     Get the first image in the pasteboard, if any.
     */
    var image: ImageRepresentable? {
        images?.first
    }

    /**
     Get all images in the pasteboard.
     */
    var images: [ImageRepresentable]? {
        readObjects(forClasses: [NSImage.self]) as? [NSImage]
    }
}
#endif
