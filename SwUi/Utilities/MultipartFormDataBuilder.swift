//
//  MultipartFormDataBuilder.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 19.09.2023.
//

import Foundation

// MARK: - Usage
/*
 let boundary: String = UUID().uuidString
 
 var request: URLRequest = URLRequest(url: url)
 request.httpMethod = "POST"
 
 let multipartHeader = MultipartFormDataBuilder.multipartFormDataHeader(boundary: boundary)
 request.setValue(multipartHeader.value, forHTTPHeaderField: multipartHeader.HTTPHeaderField)
 
 var bodyData: Data = MultipartFormDataBuilder(boundary: boundary)
     .addField(name: "id", value: scheme.id)
     .addField(name: "sceneType", value: scheme.sceneType)
     .addData(scheme.photoData, withName: "photo", fileName: scheme.photoFileName, mimeType: "image/jpeg")
     .buildHttpBody()
 
 request.httpBody = bodyData
 
 URLSession.shared.dataTask(with: request) { data, res, err in
    // Code
 }
 .resume()
 */


// MARK: - Code
final class MultipartFormDataBuilder {
    private let boundary: String
    
    init(boundary: String) {
        self.boundary = boundary
    }
    
    private var bodyData: Data = Data()
    private var divider: Data = "\r\n".data(using: .utf8)!
    
    /// Add file data
    func addData(_ data: Data, withName: String, fileName: String, mimeType: MimeTypeEnum) -> Self {
        addData(data, withName: withName, fileName: fileName, mimeType: mimeType.rawValue)
    }
    
    /// Add file data
    func addData(_ data: Data, withName: String, fileName: String, mimeType: String) -> Self {
        bodyData.append("--\(boundary)\r\n".data(using: .utf8)!)
        bodyData.append("Content-Disposition: form-data; name=\"\(withName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        bodyData.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)
        bodyData.append(data)
        bodyData.append(divider)

        return self
    }
    
    /// Add form field
    func addField(name: String, value: String) -> Self {
        bodyData.append("--\(boundary)\r\n".data(using: .utf8)!)
        bodyData.append("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n".data(using: .utf8)!)
        bodyData.append(value.data(using: .utf8)!)
        bodyData.append(divider)
        
        return self
    }
    
    func buildHttpBody() -> Data {
        // Add the closing boundary
        bodyData.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        return bodyData
    }
}

extension MultipartFormDataBuilder {
    static func multipartFormDataHeader(boundary: String) -> (value: String, HTTPHeaderField: String) {
        return ("multipart/form-data; boundary=\(boundary)", "Content-Type")
    }
}

enum MimeTypeEnum: String {
    case imageJpeg = "image/jpeg"
    case imagePng = "image/png"
    case imageGif = "image/gif"
    case imageTiff = "image/tiff"
    case textPlain = "text/plain"
    case videoQuicktime = "video/quicktime"
    case videoMpeg = "video/mpeg"
}
