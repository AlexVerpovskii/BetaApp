//
//  UserSettings.swift
//  Beta
//
//  Created by black on 11.11.2021.
//

import Foundation

final class UserSettings {
    
    private enum SettingsKeys: String {
        case token
    }
    
    static var token: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.token.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.token.rawValue
            if let token = newValue {
                defaults.set(token, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
