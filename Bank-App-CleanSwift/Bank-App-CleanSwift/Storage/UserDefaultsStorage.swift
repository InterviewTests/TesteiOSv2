//
//  UserDefaultsStorage.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 17/03/21.
//

import Foundation

class UserDefaultsStorage: Storage {
    private let storage = UserDefaults.standard
    
    func deleteUsername() -> Bool {
        storage.removeObject(forKey: Constants.USERNAME_KEY)
                
        return true
    }
    
    func deleteUser() -> Bool {
        storage.removeObject(forKey: Constants.USER_KEY)
        return true
    }
    
    func persistUser(_ user: User) -> Bool {
        storage.set(try? PropertyListEncoder().encode(user), forKey: Constants.USER_KEY)
        return true
    }
    
    func fetchUser() -> User? {
        let user = try? PropertyListDecoder().decode(User.self, from: storage.value(forKey: Constants.USER_KEY) as! Data)
        return user
    }
    
    func persistUsername(_ username: String) -> Bool {
        storage.set(username, forKey: Constants.USERNAME_KEY)        
        return true
    }
    
    func fetchUsername() -> String? {
        return storage.string(forKey: Constants.USERNAME_KEY)
    }
}
