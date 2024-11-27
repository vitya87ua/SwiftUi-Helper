//
//  NullEncodable.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 07.10.2024.
//

import Foundation

// Use in case where need set NULL to JSON
@propertyWrapper
struct NullEncodable<T>: Encodable where T: Encodable {
    
    var wrappedValue: T?
    
    init(wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch wrappedValue {
        case .some(let value): try container.encode(value)
        case .none: try container.encodeNil()
        }
    }
}

/*
 struct Test: Encodable {
     @NullEncodable var name: String
     @NullEncodable var description: String?
     @NullEncodable var tuplet: Tuplet?
 }

 struct Tuplet: Encodable {
     let a: String
     let b: Int
     @NullEncodable var c: String?
 }

 var test: Test = Test(name: "Bobby")
 test.tuplet = Tuplet(a: "whee", b: 42)

 let data = try JSONEncoder().encode(test)
 Log(String(data: data, encoding: .utf8) ?? "")
 
 // RESULT
 {
   "name": "Bobby",
   "description": null,
   "tuplet": {
     "a": "whee",
     "b": 42,
     "c": null
   }
 }
 */
