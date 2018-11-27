//
//  LoginKeyChain.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 27/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit
import Security

let kSecClassValue = NSString(format: kSecClass)
let kSecAttrAccountValue = NSString(format: kSecAttrAccount)
let kSecValueDataValue = NSString(format: kSecValueData)
let kSecClassGenericPasswordValue = NSString(format: kSecClassGenericPassword)
let kSecAttrServiceValue = NSString(format: kSecAttrService)
let kSecMatchLimitValue = NSString(format: kSecMatchLimit)
let kSecReturnDataValue = NSString(format: kSecReturnData)
let kSecMatchLimitOneValue = NSString(format: kSecMatchLimitOne)

class LoginKeyChain: NSObject {
    
    class func updatePassword(service: String, account:String, data: String) {
        
        
        if let dataFromString: Data = data.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            
            // Instantiate a new default keychain query
            let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, account, kCFBooleanTrue, kSecMatchLimitOneValue], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue, kSecReturnDataValue, kSecMatchLimitValue])
            
            let status = SecItemUpdate(keychainQuery as CFDictionary, [kSecValueDataValue:dataFromString] as CFDictionary)
            
            if (status != errSecSuccess) {
//                if let err = SecCopyErrorMessageString(status, nil) {
                    print("Read failed: ")
//                }
            }
        }
    }
    
    
    class func removePassword(service: String, account:String) {
        
        // Instantiate a new default keychain query
        let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, account, kCFBooleanTrue, kSecMatchLimitOneValue], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue, kSecReturnDataValue, kSecMatchLimitValue])
        
        // Delete any existing items
        let status = SecItemDelete(keychainQuery as CFDictionary)
        if (status != errSecSuccess) {
//            if let err = SecCopyErrorMessageString(status, nil) {
                print("Remove failed: ")
//            }
        }
        
    }
    
    class func savePassword(userAccount:String, password:String) {
        let service = "user1"
        if let accountDataFromString = userAccount.data(using: String.Encoding.utf8, allowLossyConversion: false), let passwordData = password.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            
            // Instantiate a new default keychain query
            let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, accountDataFromString, passwordData], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecValueDataValue,kSecValueDataValue])
            
            // Add the new keychain item
            let status = SecItemAdd(keychainQuery as CFDictionary, nil)
            
            if (status != errSecSuccess) {    // Always check the status
                //                if let err = SecCopyErrorMessageString(status, nil) {
                print("Write failed: ")
                //                }
            }
        }
    }
    
//    class func savePassword(service: String, account:String, data: String) {
//        if let dataFromString = data.data(using: String.Encoding.utf8, allowLossyConversion: false) {
//
//            // Instantiate a new default keychain query
//            let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, account, dataFromString], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue, kSecValueDataValue])
//
//            // Add the new keychain item
//            let status = SecItemAdd(keychainQuery as CFDictionary, nil)
//
//            if (status != errSecSuccess) {    // Always check the status
////                if let err = SecCopyErrorMessageString(status, nil) {
//                    print("Write failed: ")
////                }
//            }
//        }
//    }
    
//    class func loadPassword(service: String, account:String) -> String? {
//        // Instantiate a new default keychain query
//        // Tell the query to return a result
//        // Limit our results to one item
//        let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, account, kCFBooleanTrue, kSecMatchLimitOneValue], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue, kSecReturnDataValue, kSecMatchLimitValue])
//
//        var dataTypeRef :AnyObject?
//
//        // Search for the keychain items
//        let status: OSStatus = SecItemCopyMatching(keychainQuery, &dataTypeRef)
//        var contentsOfKeychain: String?
//
//        if status == errSecSuccess {
//            if let retrievedData = dataTypeRef as? Data {
//                contentsOfKeychain = String(data: retrievedData, encoding: String.Encoding.utf8)
//            }
//        } else {
//            print("Nothing was retrieved from the keychain. Status code \(status)")
//        }
//
//        return contentsOfKeychain
//    }
    
    class func loadPassword() -> String? {
        // Instantiate a new default keychain query
        // Tell the query to return a result
        // Limit our results to one item
        let service = "user1"
        
        let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, kCFBooleanTrue, kSecMatchLimitOneValue], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecReturnDataValue, kSecMatchLimitValue])
        
        var dataTypeRef :AnyObject?
        
        // Search for the keychain items
        let status: OSStatus = SecItemCopyMatching(keychainQuery, &dataTypeRef)
        var contentsOfKeychain: String?
        
        if status == errSecSuccess {
            if let retrievedData = dataTypeRef as? Data {
                contentsOfKeychain = String(data: retrievedData, encoding: String.Encoding.utf8)
            }
        } else {
            print("Nothing was retrieved from the keychain. Status code \(status)")
        }
        
        return contentsOfKeychain
    }
    
}
