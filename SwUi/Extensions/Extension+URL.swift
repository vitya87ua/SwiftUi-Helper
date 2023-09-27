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
    
    func fileSize() -> String? {
        var result: String?
        
        do {
            let fileAttr = try FileManager.default.attributesOfItem(atPath: self.path)
            let byteFormat = ByteCountFormatter()
            byteFormat.allowedUnits = [.useMB]
            byteFormat.countStyle = .file
            result = byteFormat.string(fromByteCount: fileAttr[FileAttributeKey.size] as! Int64)
        } catch {
            Log("failed to fetch file for size indicator: \(error.localizedDescription)")
        }
        return result
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
    
    /// Return string like "Macintosh HD ▸ Users ▸ userName ▸ Movies"
    func prettyPath(separator: String = " ▸ ") -> String {
        var result: String = "Macintosh HD" + separator
        
        let omitFolders: [String] = ["", "Library", "Containers", Bundle.main.bundleIdentifier ?? "", "Data"]
        let components: [String] = self
            .deletingLastPathComponent()
            .path
            .components(separatedBy: "/")
            .filter { !omitFolders.contains($0) }
        
        result += components.joined(separator: separator)
        
        return result
    }
}

