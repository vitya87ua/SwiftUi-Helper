//
//  Extension+URL.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 23.08.2022.
//

import Foundation

extension URL {
    var fileExists: Bool {
        FileManager.default.fileExists(atPath: self.path)
    }
}

