//
//  Extension+NSApplication.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 21.05.2024.
//

import Foundation

#if canImport(AppKit)
import AppKit

extension NSApplication {
    // Restart App
    func relaunch(afterDelay seconds: TimeInterval = 1) -> Never {
        let task = Process()
        task.launchPath = "/bin/sh"
        task.arguments = ["-c", "sleep \(seconds); open \"\(Bundle.main.bundlePath)\""]
        task.launch()
        
        NSApp.terminate(self)
        exit(0)
    }
}
#endif
