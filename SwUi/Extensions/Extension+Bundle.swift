//
//  Extension+Bundle.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 27.09.2023.
//

import Foundation

extension Bundle {
    
    // "SwUi"
    static var bundleName: String {
        return (Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String) ?? "Unknown"
    }
    
    // "SwUi"
    static var displayName: String {
        return (Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String) ?? "Unknown"
    }
    
    // "1.0.7"
    static var shortVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "Unknown"
    }
    
    // "34"
    static var buildVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "Unknown"
    }
}
