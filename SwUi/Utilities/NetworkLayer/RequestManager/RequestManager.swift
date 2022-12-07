//
//  RequestManager.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.12.2022.
//

import Foundation

struct ServerResponse: Codable {
    let message: String
    let success: Bool
}

protocol RequestModel {
    var baseUrl: URL { get }
    var apiVersion: String? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get set }
    var body: Data? { get set }
    var queryItems: [String: String]? { get set }
}

class RequestManager {
    
    func request<T: Codable>(_ model: RequestModel, completion: @escaping (Result<T, Error>) -> Void) {
        
        let urlRequest = createURLRequest(with: model)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse else {
                return completion(.failure(NetworkManagerError.noResponse))
            }
            
            switch response.statusCode {
            case 200...299:
                guard let data = data else {
                    return completion(.failure(NetworkManagerError.responseDataError))
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            default:
                guard let data = data else {
                    return completion(.failure(NetworkManagerError.responseDataError))
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(ServerResponse.self, from: data)
                    Log(decodedData)
                    return completion(.failure(NetworkManagerError.serverMessage(error: decodedData.message)))
                } catch {
                    Log(error, "Status code: \(response.statusCode)", String(data: data, encoding: .utf8))
                    completion(.failure(error))
                }
            }
        }
        .resume()
    }
    
    @available(macOS 12.0, *)
    func request<T: Codable>(_ model: RequestModel) async -> Result<T, Error> {
        
        let urlRequest = createURLRequest(with: model)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(NetworkManagerError.noResponse)
            }
            
            switch response.statusCode {
            case 200...299:
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    return .success(decodedData)
                } catch {
                    return .failure(error)
                }
            default:
                do {
                    let decodedData = try JSONDecoder().decode(ServerResponse.self, from: data)
                    Log(decodedData)
                    return .failure(NetworkManagerError.serverMessage(error: decodedData.message))
                } catch {
                    Log(error, "Status code: \(response.statusCode)", String(data: data, encoding: .utf8))
                    return .failure(error)
                }
            }
        } catch {
            return .failure(error)
        }
    }
    
    private func createURLRequest(with model: RequestModel) -> URLRequest {
        let baseUrl = model.baseUrl
            .appendingPathComponent(model.apiVersion ?? "")
            .appendingPathComponent(model.path)
        
        var urlComponents = URLComponents(string: baseUrl.absoluteString)
        
        if let queryItems = model.queryItems {
            urlComponents?.queryItems = queryItems.compactMap { item in
                URLQueryItem(name: item.key, value: item.value)
            }
        }
        
        var urlRequest = URLRequest(url: urlComponents?.url ?? baseUrl)
        urlRequest.httpMethod = model.method.rawValue
        urlRequest.allHTTPHeaderFields = model.headers
        
//        if let token = App.storage.token {
//            urlRequest.allHTTPHeaderFields!["Authorization"] = "Bearer \(token)"
//        }
        
        urlRequest.httpBody = model.body
        
        return urlRequest
    }
}
