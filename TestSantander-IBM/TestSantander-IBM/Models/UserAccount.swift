//
//  UserAccount.swift
//  TestSantander-IBM
//
//  Created by Renato Carvalhan on 22/01/19.
//  Copyright © 2019 Renato Carvalhan. All rights reserved.
//

import UIKit
import ObjectMapper

@objcMembers
class UserAccount: NSObject, Mappable {
    
    private static var dbAttributes: [String] = ["userId", "name", "bankAccount", "agency", "balance"]
    
    var userId: Int = 0
    var name: String?
    var bankAccount: String?
    var agency: String?
    var balance: Float = 0.00
    
    init(userId: Int? = 0, name: String? = nil, bankAccount: String? = nil, agency: String? = nil, balance: Float? = 0.00) {
        self.userId = userId!
        self.name = name
        self.bankAccount = bankAccount
        self.agency = agency
        self.balance = balance!
    }
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        self.userId <- map["userId"]
        self.name <- map["name"]
        self.bankAccount <- map["bankAccount"]
        self.agency <- map["agency"]
        self.balance <- map["balance"]
    }
    
    static var current: UserAccount? {
        get {
            if let userInfo = UserDefaults.standard.dictionary(forKey: "current_user_account") {
                let user = UserAccount()
                
                for attribute in UserAccount.dbAttributes {
                    user.setValue(userInfo[attribute], forKey: attribute)
                }
                
                return user
            }
            
            return nil
        }
        set(current) {
            if let user = current {
                var userInfo: [String : Any] = [:]
                
                for attribute in UserAccount.dbAttributes {
                    userInfo[attribute] = user.value(forKey: attribute)
                }
                
                UserDefaults.standard.set(userInfo, forKey: "current_user_account")
            } else {
                UserDefaults.standard.set(nil, forKey: "current_user_account")
            }
        }
    }
    
    static func clearUserAccountBased() {
        UserDefaults.standard.removeObject(forKey: "current_user_account")
    }
}
