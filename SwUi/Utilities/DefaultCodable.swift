//
//  DefaultCodable.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 11.11.2022.
//

import Foundation

@propertyWrapper
struct DefaultCodable<T: Codable> {
    let key: String
    let defaultValue: T? = nil
    let userDefaultsSuite : UserDefaults = UserDefaults.standard

    public var wrappedValue: T? {
        get {
            if let data = userDefaultsSuite.object(forKey: key) as? Data,
                let orgVal = try? JSONDecoder().decode(T.self, from: data) {
                return orgVal
            } else {
                return defaultValue
            }
        }
        set {
            if let newValue = newValue,
                let data = try? JSONEncoder().encode(newValue) {
                userDefaultsSuite.set(data, forKey: key)
            } else {
                userDefaultsSuite.set(newValue, forKey: key)
            }
        }
    }
}

// MARK: - Usage
// @DefaultCodable(key: "user") var user: UserEntity?
