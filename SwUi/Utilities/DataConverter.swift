//
//  DataConverter.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 31.10.2022.
//

import Foundation

// Convert Data to Codable, and Codable to Data.
// Perfect use when you need save model to UserDefaults as data.
class DataConverter {
    static func convertTo<T: Codable>(data: T, withDebug debug: Bool = false) -> Data? {
        var result: Data?
        
        do {
            if debug {
                result = try JSONEncoder().encode(data)
                print("DataConverter successfully convert \(data) to data!")
            } else {
                return try? JSONEncoder().encode(data)
            }
        } catch {
            print("DataConverter catch error when try to conver \(type(of: data)) to data! Error:", error, error.localizedDescription)
        }
        
        return result
    }
    
    static func convertFrom<T: Codable>(data: Data, to: T.Type, withDebug debug: Bool = false) -> T? {
        var result: T?
        
        do {
            if debug {
                result = try JSONDecoder().decode(T.self, from: data)
                print("DataConverter successfully convert data to \(to) \n\(result!)")
            } else {
                return try? JSONDecoder().decode(T.self, from: data)
            }
        } catch {
            print("DataConverter catch error when try to convert data to \(to)! Error:", error, error.localizedDescription)
        }
        
        return result
    }
}

// MARK: - USAGE

/*
 struct User: Codable {
    let name: String
    let age: Int
 }
 
 let data = DataConverter.convertTo(data: User(name: "Benn", age: 87))
 print(data) // 24 bytes
 
 let model = DataConverter.convertFrom(data: data!, to: User.self, withDebug: true)
 print(model) // MyNEw(name: "Benn", age: 87)
 
 */
