//
//  Defaults.swift
//  Lesson 9
//
//  Created by  Alexander on 10.07.2020.
//  Copyright © 2020  Alexander. All rights reserved.
//

import Foundation


struct Defaults {
    
    private var user = User()
    
    mutating func save(login: String, password: String) {
        user.login = login
        user.password = password
    }
    
    func getData() -> String? {
        
        guard let login = user.login, let password = user.password else { return nil }
        
        return "Login - \(String(describing: login))\nPassword - \(String(describing: password))"
    }
    
    func clearData() {
        user.clear()
    }
}

 private struct User {
    
    private enum Keys: String {
        case login
        case password
    }
    private let userDefaults = UserDefaults.standard
    
    var login: String? {
        
        get {
            return userDefaults.object(forKey: Keys.login.rawValue) as? String ?? nil
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.login.rawValue)
            userDefaults.synchronize()
            print("Логин сохранен")
        }
    }
    
    var password: String? {
        get {
            return userDefaults.object(forKey: Keys.password.rawValue) as? String ?? nil
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.password.rawValue)
            userDefaults.synchronize()
            print("Пароль сохранен")

        }
    }
    
    func clear() {
        userDefaults.removeObject(forKey: Keys.login.rawValue)
        userDefaults.removeObject(forKey: Keys.password.rawValue)
        userDefaults.synchronize()
    }
}
