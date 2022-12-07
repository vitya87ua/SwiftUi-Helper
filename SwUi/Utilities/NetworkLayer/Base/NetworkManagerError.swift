//
//  NetworkManagerError.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.12.2022.
//

import Foundation

enum NetworkManagerError: Error {
    case badURL
    case badURLRequest
    case responseDataError
    case unexpectedStatusCode(code: Int)
    case noResponse
    case unauthorized
    case unknown
    case invalidCredentials
    case serverMessage(error: String)
}

extension NetworkManagerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "Bad URL or URL is nil"
        case .responseDataError:
            return "Bad response Data or Data is nil"
        case .unauthorized:
            return "Session expired"
        case .unknown:
            return "Unknown error"
        case .unexpectedStatusCode(let code):
            return "UnexpectedStatusCode: \(code)"
        case .noResponse:
            return "There is no response"
        case .badURLRequest:
            return "Bad URLRequest or URLRequest is nil"
        case .invalidCredentials:
            return "Invalid Credentials"
        case .serverMessage(error: let error):
            return "Error: \(error)"
        }
    }
}
