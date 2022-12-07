//
//  PostSignInRequest.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.12.2022.
//

import Foundation

struct Credential {
    let email: String
    let password: String
}

struct PostSignInRequest: RequestModel {
    var baseUrl: URL
    var apiVersion: String?
    var path: URLPath
    var method: HTTPMethod
    var headers: HTTPHeaders
    var body: Data?
    var queryItems: [String: String]?
    
    init(credential: Credential) {
        baseUrl = URL(string: "www.google.com.ua")!
        apiVersion = "v1" // API version if need
        path = .usersSignIn
        method = .post
        headers = .applicationJson
        body = Data.createApplicationJsonData(withParameters: [
            "email": credential.email,
            "password": credential.password
        ])
        queryItems = nil
    }
}
