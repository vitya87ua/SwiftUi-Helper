//
//  UserDefaultsDB.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 28.10.2025.
//

import Foundation

// Better to use when object key is very important, and need save values without mistake
// Better to use when create Local DB.
// If you do not need separated suit, remove suiteName from init and replace `defaults` on UserDefaults.standard

protocol DBKeyed {
    static var dbKey: String { get }
}

@propertyWrapper
fileprivate struct UserDefaultsDB<T: Codable> {
    typealias DBItem = Codable & DBKeyed
    
    private let defaults: UserDefaults?
    private let dbKey: String
    private let defaultValue: T
    
    /// For case when `T` is NOT Optional
    init(suiteName: String, defaultValue: T) where T: DBItem {
        self.defaults = UserDefaults(suiteName: suiteName)
        self.dbKey = T.dbKey
        self.defaultValue = defaultValue
    }
    
    /// For case when `T` is Optional
    init<V>(suiteName: String, defaultValue: T) where V: DBItem, T == Optional<V> {
        self.defaults = UserDefaults(suiteName: suiteName)
        self.dbKey = V.dbKey
        self.defaultValue = defaultValue
    }
    
    /// For case when `T` is Sequence
    init(suiteName: String, defaultValue: T) where T: Sequence, T.Element: DBItem {
        self.defaults = UserDefaults(suiteName: suiteName)
        self.dbKey = T.Element.dbKey
        self.defaultValue = defaultValue
    }
    
    /// For case when `T` is Dictionary
    init<K, V>(suiteName: String, defaultValue: T) where T: Codable, K: Hashable, V: DBItem, T == Dictionary<K, V> {
        self.defaults = UserDefaults(suiteName: suiteName)
        self.dbKey = V.dbKey
        self.defaultValue = defaultValue
    }
    
    /// For case when `T` is Dictionary & Dictionary.Value is Sequence
    init<K, V>(suiteName: String, defaultValue: T) where T: Codable, K: Hashable, V: Sequence, V.Element: DBItem, T == Dictionary<K, V> {
        self.defaults = UserDefaults(suiteName: suiteName)
        self.dbKey = V.Element.dbKey
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            guard
                let defaults,
                let data = defaults.object(forKey: dbKey) as? Data,
                let value = try? JSONDecoder().decode(T.self, from: data)
            else { return defaultValue }
            
            return value
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                defaults?.set(encoded, forKey: dbKey)
            }
        }
    }
}

// MARK: - Usage

/*
 struct UserModel {
     let name: String
     let age: Int
 }

 extension UserModel: DBKeyed {
     static var dbKey: String {
         "UserModelDBKey"
     }
 }

 static let suiteName: String = "com.suiteName"

 @UserDefaultsDB(suiteName: suiteName, defaultValue: nil)
 private var user: UserModel?
 */
