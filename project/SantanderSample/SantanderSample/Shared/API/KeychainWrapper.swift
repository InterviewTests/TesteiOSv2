//
//  KeychainWrapper.swift
//  SantanderSample
//
//  Created by Virgilius Santos on 28/10/18.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class KeychainManager {
    
    enum DestinationType: String {
        case user, password
    }
    
    private static var wrapper = KeychainWrapper.standard
    
    /// Add a string value to keychain
    class func save(_ value: String, type: DestinationType) -> Bool {
        let saveSuccessful: Bool
            = wrapper.set(value, forKey: type.rawValue)
        return saveSuccessful
    }
    
    /// Retrieve a string value from keychain:
    class func get(type: DestinationType) -> String? {
        let retrievedString: String?
            = wrapper.string(forKey: type.rawValue)
        return retrievedString
    }
    

    ///Remove a string value from keychain:
    class func remove(type: DestinationType) -> Bool {
        let removeSuccessful: Bool
            = wrapper.removeObject(forKey: type.rawValue)
        return removeSuccessful
    }
    
}
