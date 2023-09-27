//
//  Extension+NSScreen.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 27.09.2023.
//

import Foundation

#if canImport(AppKit)

extension NSScreen {
    var displayID: CGDirectDisplayID {
        deviceDescription[NSDeviceDescriptionKey(rawValue: "NSScreenNumber")] as? CGDirectDisplayID ?? 0
    }
    
    static var getScreenWithMouse: NSScreen? {
        let mouseLocation = NSEvent.mouseLocation
        let screens = NSScreen.screens
        let screenWithMouse = screens.first { NSMouseInRect(mouseLocation, $0.frame, false) }
        return screenWithMouse
    }
}

#endif
