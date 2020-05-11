//
//  UserKeychainStore.swift
//  TesteSantader
//
//  Created by Bruno Chen on 08/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

protocol KeychainServiceProtocol {
    func saveUserPassword(userID: String, password: String)
    func getUserPassword() -> (userID: String?, password: String?)
    func removeUserPassword()
    
}

class UserKeychainService: KeychainServiceProtocol {
    
    func saveUserPassword(userID: String, password: String) {
        KeychainWrapper.standard.set(userID, forKey: "userID")
        KeychainWrapper.standard.set(password, forKey: "password")
        
    }
    
    func getUserPassword() -> (userID: String?, password: String?) {
        let useID = KeychainWrapper.standard.string(forKey: "userID")
        let password = KeychainWrapper.standard.string(forKey: "password")
        return (useID, password)
    }
    
    func removeUserPassword() {
        KeychainWrapper.standard.removeAllKeys()
    }
    
    
    
    
    
//    func fetchUser(userID: String, password: String, completionHandler: @escaping (UserData?, UserStoreError?) -> Void) {
//
//    }
//
//    func saveUserPassword(account: String, password: String) -> OSStatus {
//        let credentials = Credentials(username: account, password: password)
//        let account = credentials.username
//        let password = credentials.password.data(using: String.Encoding.utf8)!
//    // store password as data and if you want to store username
//        var query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
//                                    kSecAttrAccount as String: account,
//                                    kSecValueData as String: password]
//
//        let status = SecItemDelete((query as CFDictionary))
//
//        return status
//
//    }
//
//    func getData(key: String) -> Data? {
//        let query = [
//            kSecClass as String       : kSecClassGenericPassword,
//            kSecAttrAccount as String : key,
//            kSecReturnData as String  : kCFBooleanTrue!,
//            kSecMatchLimit as String  : kSecMatchLimitOne ] as [String : Any]
//
//        var dataTypeRef: AnyObject? = nil
//
//        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
//
//        if status == noErr {
//            return dataTypeRef as! Data?
//        } else {
//            return nil
//        }
//    }
//
//    class func createUniqueID() -> String {
//        let uuid: CFUUID = CFUUIDCreate(nil)
//        let cfStr: CFString = CFUUIDCreateString(nil, uuid)
//
//        let swiftString: String = cfStr as String
//        return swiftString
//    }
    
}

//extension Data {
//
//    init<T>(from value: T) {
//        var value = value
//        self.init(buffer: UnsafeBufferPointer(start: &value, count: 1))
//    }
//
//    func to<T>(type: T.Type) -> T {
//        return self.withUnsafeBytes { $0.load(as: T.self) }
//    }
//}
//
//struct Credentials {
//    var username: String
//    var password: String
//}
//
//enum KeychainError: Error {
//    case noPassword
//    case unexpectedpPasswordData
//    case unhandledError(status: OSStatus)
//}
