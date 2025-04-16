//
//  Extension+JSONDecoder.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 16.04.2025.
//

import Foundation

extension JSONDecoder {
    enum JSONDecoderError: Error {
        case fileDoesNotExist
    }
    
    /// Decodes a top-level value of the given type from the given JSON representation.
    ///
    /// - parameter type: The type of the value to decode.
    /// - parameter url: The url to file with json data to decode from.
    /// - returns: A value of the requested type.
    /// - throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not valid JSON.
    /// - throws: `JSONDecoderError.fileDoesNotExist` if file from URL does not exist.
    /// - throws: An error if any value throws an error during decoding.
    func decode<T>(_ type: T.Type, from url: URL) throws -> T where T : Decodable {
        let data = try Data(contentsOf: url)
        return try decode(type, from: data)
    }
    
    /// Decodes a top-level value of the given type from the given JSON representation.
    ///
    /// - parameter type: The type of the value to decode.
    /// - parameter fileName: The name of file with json data to decode from.
    /// - parameter fileExtension: The extension of file with json data to decode from. Default extension is `json`
    /// - returns: A value of the requested type.
    /// - throws: `JSONDecoderError.fileDoesNotExist` if file with `fileName` & `fileExtension` does not exist.
    /// - throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not valid JSON.
    /// - throws: An error if any value throws an error during decoding.
    func decode<T>(_ type: T.Type, fileName: String, extension fileExtension: String? = "json") throws -> T where T : Decodable {
        guard
            let fileUrl = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        else { throw JSONDecoderError.fileDoesNotExist }
        
        return try decode(type, from: fileUrl)
    }
}

extension JSONDecoder.DateDecodingStrategy {
    
    /// Format "YYYY-MM-DD'T'HH:mm:ss.SSS'Z'"
    static var iso8601WithFractionalSeconds: Self {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSS'Z'"
        return .formatted(formatter)
    }
}
