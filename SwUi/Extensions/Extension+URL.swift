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
    
    func addPrefixToFileName(_ prefix: String) -> URL {
        var result: URL
        
        let pathExtension: String = self.pathExtension
        let fileName: String = self.deletingPathExtension().lastPathComponent
        
        result = self
            .deletingLastPathComponent()
            .appendingPathComponent(prefix + fileName)
            .appendingPathExtension(pathExtension)
        
        return result
    }
    
    func addSuffixToFileName(_ suffix: String) -> URL {
        var result: URL
        
        let pathExtension: String = self.pathExtension
        let fileName: String = self.deletingPathExtension().lastPathComponent
        
        result = self
            .deletingLastPathComponent()
            .appendingPathComponent(fileName + suffix)
            .appendingPathExtension(pathExtension)
        
        return result
    }
    
    func changePathExtension(_ pathExtension: String) -> URL {
        self
            .deletingPathExtension()
            .appendingPathExtension(pathExtension)
    }
}

