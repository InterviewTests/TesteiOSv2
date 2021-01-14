//
//  User.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/13/21.
//

import Foundation

class User {
    static var shared = User()
    private init() {}
    
    private(set) var info: LoggedinUserStruct?
    var id: Int { return info?.userId ?? 0 }
    
    
    func login(_ userInfo: LoggedinUserStruct) {
        self.info = userInfo
    }
    
    func logout() {
        self.info = nil
        
        // TODO: REMOVE locally
        LoginInfoLocalEntity.clear()
    }
}
