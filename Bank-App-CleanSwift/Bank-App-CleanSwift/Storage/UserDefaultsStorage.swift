//
//  UserDefaultsStorage.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 17/03/21.
//

import Foundation

class UserDefaultsStorage: Storage {
    private let storage = UserDefaults.standard
    
    func persistUser(user: User) -> Bool {
        storage.setValue(user, forKey: Constants.USER_KEY)
        
        return true
    }
    
    func fetchUser() -> User? {
        return storage.value(forKey: Constants.USER_KEY) as? User
    }
    
    func persistUsername(username: String) -> Bool {
        storage.set(username, forKey: Constants.USERNAME_KEY)
        
        return true
    }
    
    func fetchUsername() -> String? {
        return storage.string(forKey: Constants.USERNAME_KEY) ?? ""
    }
}
