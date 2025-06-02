//
//  Extension+DynamicCodingKey.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 02.06.2025.
//

import Foundation

// MARK: - DynamicCodingKey
struct DynamicCodingKey: CodingKey {
    var stringValue: String
    init(stringValue: String) {
        self.stringValue = stringValue
    }
    
    var intValue: Int?
    init?(intValue: Int) {
        self.init(stringValue: "\(intValue)")
        self.intValue = intValue
    }
}

// MARK: - KeyedDecodingContainerProtocol
extension KeyedDecodingContainerProtocol where Key == DynamicCodingKey {
    func decodeDynamicKeys<T>(_ type: T.Type, forKeys keys: [String]) throws -> T where T : Decodable {
        guard !keys.isEmpty else { throw DecodingError.DynamicCodingKeyError.decodeDynamicKeysArrayIsEmpty }
        
        for key in keys {
            if let result: T = try? decode(type, forKey: DynamicCodingKey(stringValue: key)) {
                return result
            }
        }
        
        return try decode(type, forKey: DynamicCodingKey(stringValue: keys.first ?? ""))
    }
    
    func decodeDynamicKeysIfPresent<T>(_ type: T.Type, forKeys keys: [String]) throws -> T? where T : Decodable {
        guard !keys.isEmpty else { throw DecodingError.DynamicCodingKeyError.decodeDynamicKeysArrayIsEmpty }
        
        for key in keys {
            if let result: T = try? decodeIfPresent(type, forKey: DynamicCodingKey(stringValue: key)) {
                return result
            }
        }
        
        return nil
    }
}

// MARK: - DynamicCodingKeyError
extension DecodingError {
    enum DynamicCodingKeyError: Error {
        case decodeDynamicKeysArrayIsEmpty
    }
}

// MARK: - Example
// For example we have JSON where one of property time to time has diff names, "nutrient" & "nutrients"
// In default decode logic it will be Error, but we can use DynamicCodingKey and decode data with success

/*
 struct FruitsModel: Codable {
     let fruits: [Fruit]
 }

 struct Fruit: Codable {
     let name, color: String
     let nutrients: Nutrients
     
     init(from decoder: any Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
         self.name = try container.decode(String.self, forKey: .name)
         self.color = try container.decode(String.self, forKey: .color)
         
         let nutContainer = try decoder.container(keyedBy: DynamicCodingKey.self) // <- DynamicCodingKey
         self.nutrients = try nutContainer.decodeDynamicKeys(Nutrients.self, forKeys: ["nutrients", "nutrient"]) // <- Set all possible keys
     }
 }

 struct Nutrients: Codable {
     let calories: Int
     let fiber: String
     let vitaminC, potassium: String?
 }

 final class SomeViewModel: ObservableObject {

     // JSON with diff "nutrient" & "nutrients"
     let data: Data = """
         {
           "fruits": [
             {
               "name": "Apple",
               "color": "Red",
               "nutrients": { // <- "nutrients"
                 "calories": 52,
                 "fiber": "2.4g",
                 "vitaminC": "4.6mg"
               }
             },
             {
               "name": "Banana",
               "color": "Yellow",
               "nutrient": { // <- "nutrient"
                 "calories": 89,
                 "fiber": "2.6g",
                 "potassium": "358mg"
               }
             },
             {
               "name": "Orange",
               "color": "Orange",
               "nutrients": { // <- "nutrients"
                 "calories": 47,
                 "fiber": "2.4g",
                 "vitaminC": "53.2mg"
               }
             }
           ]
         }
         """
         .data(using: .utf8)!

     func decode() {
         do {
             let model: FruitsModel = try JSONDecoder().decode(FruitsModel.self, from: data)
 
             model.fruits.forEach {
                 print($0)
             }
         } catch {
             print(error)
         }
     }
 }

 */
