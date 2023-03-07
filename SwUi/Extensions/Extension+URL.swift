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
    
    var fileFormat: String {
        self.pathExtension
    }
    
    func fileName(withFormat: Bool = false) -> String {
        if withFormat {
            return self.lastPathComponent
        } else {
            return self.deletingPathExtension()
                .lastPathComponent
        }
    }
}

