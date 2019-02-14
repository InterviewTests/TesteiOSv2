//
//  KeychainManager.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 14/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation
import KeychainSwift

struct KeychainManager {
    //MARK: - Singleton
    static let shared = KeychainManager()

    //MARK: - Properties
    let keychain = KeychainSwift()
    
    
    //MARK: - Functions
    func storeCredentials(credentials: Dictionary<String,Any>, key: String){
        let archivedCredentials: Data = NSKeyedArchiver.archivedData(withRootObject: credentials)
        keychain.set(archivedCredentials, forKey: key)
    }
    
    func getCredentials(key: String) -> Dictionary<String,Any>?{
        if let dataDecode = keychain.getData(key){
            if let unarchivedCredentials: [String : Any] = NSKeyedUnarchiver.unarchiveObject(with: dataDecode) as? [String : Any]{
                return unarchivedCredentials
            }
        }
        return nil
    }
    
    func clearCredentials(){
        keychain.clear()
    }
    
}
