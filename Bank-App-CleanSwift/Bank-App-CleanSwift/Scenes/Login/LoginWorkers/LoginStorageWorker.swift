//
//  LoginSaveLastUserWorker.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 17/03/21.
//

import Foundation

class LoginStorageWorker {
    private var storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    func persistUsername(_ username: String) -> Bool {
        return storage.persistUsername(username)
    }
    
    func fetchLastLoggedUsername() -> String {
        return storage.fetchUsername()
    }
    
    func deleteLastLoggedUsername() -> Bool {
        return storage.deleteUsername()
    }
    
    func persistUser(_ user: User) -> Bool {
        return storage.persistUser(user)
    }
    
    func fetchLastLoggedUser() -> User? {
        return storage.fetchUser()
    }
    
    func deleteLastLoggedUser() -> Bool {
        return storage.deleteUser()
    }
}
