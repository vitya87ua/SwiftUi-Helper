//
//  Extension+NSFont.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 13.11.2023.
//

import SwiftUI

#if canImport(AppKit)

// Bridge between SwiftUI and AppKit
extension NSFont.Weight {
    init(swiftUI: Font.Weight) {
        var weight: NSFont.Weight = .regular
        
        switch swiftUI {
        case .black:
            weight = .black
        case .bold:
            weight = .bold
        case .heavy:
            weight = .heavy
        case .light:
            weight = .light
        case .medium:
            weight = .medium
        case .regular:
            weight = .regular
        case .semibold:
            weight = .semibold
        case .thin:
            weight = .thin
        case .ultraLight:
            weight = .ultraLight
        default:
            weight = .regular
        }
        
        self = weight
    }
}

#endif
