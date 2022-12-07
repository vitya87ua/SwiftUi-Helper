//
//  HTTPHeaders.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.12.2022.
//

import Foundation

typealias HTTPHeaders = [String: String]

extension HTTPHeaders {
    
    /// ["Content-type": "application/json"]
    static var applicationJson: HTTPHeaders = ["Content-type": "application/json"]
    
    /// ["Content-Type": "multipart/form-data; boundary=\(boundary)"]
    static func multipartFormDataWith(boundary: HTTPBoundary) -> HTTPHeaders {
        ["Content-Type": "multipart/form-data; boundary=\(boundary)"]
    }
}
