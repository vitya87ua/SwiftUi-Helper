//
//  SettingsUtil.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 08.07.2022.
//

import Foundation

protocol SettingsProtocol: Codable {
    static var defaultSettings: Self { get }
}

class SettingsUtil<T: SettingsProtocol> {
    
    // MARK: - Get
    static func getSettings() -> T {
        do {
            let key = String(describing: T.self)
            
            if let data = UserDefaults.standard.data(forKey: key) {
                return try JSONDecoder().decode(T.self, from: data)
            }
        } catch {
            print(#fileID, #line, "‼️ Error: ", error.localizedDescription)
        }
        
        return T.defaultSettings
    }
    
    // MARK: - Save
    static func save(settings: T) {
        do {
            let key = String(describing: T.self)
            let data = try JSONEncoder().encode(settings)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(#fileID, #line, "‼️ Error: ", error.localizedDescription)
        }
    }
}

// MARK: - Usage

struct Settings: SettingsProtocol {
    let openApp: Bool
    let autoSave: Bool
    
    static var defaultSettings: Settings {
        Settings(openApp: true, autoSave: false)
    }
}

fileprivate func loadSettings() {
    let settings: Settings = SettingsUtil.getSettings()
    Log(settings)
}

fileprivate func saveSettings() {
    let settings: Settings = Settings(openApp: true, autoSave: false)
    SettingsUtil.save(settings: settings)
    Log(settings)
}
