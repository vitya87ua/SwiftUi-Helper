//
//  KeychainManager.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 05.09.2023.
//

import Foundation

// Required -> https://github.com/evgenyneu/keychain-swift

/*
 import KeychainSwift

 enum SecureStorageEntry: CaseIterable {
     case authToken
     case pass

     var entryKey: String {
         switch self {
         case .authToken: return "authToken"
         }
     }
 }

 enum SecureStorage {

     static private let keychain = KeychainSwift()

     static func item(for entry: SecureStorageEntry) -> String? {
         keychain.get(entry.entryKey)
     }

     static func exists(for entry: SecureStorageEntry) -> Bool {
         item(for: entry) != nil
     }

     static func save(_ value: String, forEntry entry: SecureStorageEntry) {
         keychain.set(value, forKey: entry.entryKey)
     }

     static func delete(_ entry: SecureStorageEntry) {
         keychain.delete(entry.entryKey)
     }

     static func clearAll() {
         keychain.clear()
     }
 }

 */

/*
 Usage:
 
 SecureStorage.save("token", forEntry: .authToken)
 let token: String? = SecureStorage.item(for: .authToken)
 */
