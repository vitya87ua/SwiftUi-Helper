//
//  Extension+Data.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.12.2022.
//

import Foundation

extension Data {
    mutating func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
    
    /// Wrap self(data) to multipart/form-data HTTP body data with parameters
    func wrapToMultipartFormData(withName name: String, fileName: String, boundary: String) -> Data {
        var data: Data = Data()
        data.appendString("--\(boundary)\r\n")
        data.appendString("Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(fileName)\"\r\n")
        data.appendString("Content-Type: \("application/json; charset=utf-8")\r\n\r\n")
        data.append(self)
        data.appendString("\r\n")
        data.appendString("--\(boundary)--\r\n")
        return data
    }
    
    static func createApplicationJsonData(withParameters parameters: [String: Any]) -> Data? {
        do {
            let data = try JSONSerialization.data(withJSONObject: parameters, options: [])
            return data
        } catch {
            Log(error)
            return nil
        }
    }
}
