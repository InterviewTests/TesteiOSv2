//
//  keychain.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 20/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import KeychainSwift

class KeychainManager {
    
    let keychain = KeychainSwift()
    
    func retrieve(key: String) -> String? {
        return keychain.get(key)
    }
    
    func store(_ register: String, key: String) {
        keychain.set(register, forKey: key)
    }
}
