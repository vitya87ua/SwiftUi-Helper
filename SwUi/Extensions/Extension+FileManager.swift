//
//  Extension+FileManager.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 30.11.2022.
//

import Foundation

extension FileManager {
    static func allFiles(
        for searchPathDirectory: SearchPathDirectory = .documentDirectory,
        in searchPathDomainMask: SearchPathDomainMask = .userDomainMask,
        includingPropertiesForKeys keys: [URLResourceKey]? = nil
    ) -> [URL] {
        guard
            let directory = try? self.default.url(
                for: searchPathDirectory,
                in: searchPathDomainMask,
                appropriateFor: nil,
                create: false),
            let result = try? self.default.contentsOfDirectory(at: directory, includingPropertiesForKeys: keys)
        else { return [] }
        
        return result
    }
}
