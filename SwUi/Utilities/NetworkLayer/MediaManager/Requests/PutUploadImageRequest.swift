//
//  PutUploadImageRequest.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.12.2022.
//

import Foundation

struct PutUploadImageRequest: RequestModel {
    var baseUrl: URL
    var apiVersion: String?
    var path: URLPath
    var method: HTTPMethod
    var headers: HTTPHeaders
    var body: Data?
    var queryItems: [String: String]?
    
    init(imageData: Data, fileName: String) {
        let boundary = HTTPBoundary.generate
        
        baseUrl = URL(string: "www.google.com.ua")!
        apiVersion = "v1" // API version if need
        path = .filesUpload
        method = .put
        headers = .multipartFormDataWith(boundary: boundary)
        body = imageData.wrapToMultipartFormData(
            withName: "image",
            fileName: fileName,
            boundary: boundary
        )
        queryItems = nil
    }
}
