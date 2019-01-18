//
//  User-Realm.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 13/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import RealmSwift

final class UserAccountObject: Object {

    @objc dynamic var userId = 0
    @objc dynamic var name = ""
    @objc dynamic var bankAccount = ""
    @objc dynamic var agency = ""
    @objc dynamic var balance = 0.0
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}

extension UserAccountModel: Persistable {
    
    public init(managedObject: UserAccountObject) {
        userId = managedObject.userId
        name = managedObject.name
        bankAccount = managedObject.bankAccount
        agency = managedObject.agency
        balance = managedObject.balance
    }
    public func managedObject() -> UserAccountObject {
        let character = UserAccountObject()
        character.userId = userId ?? 0
        character.name = name ?? ""
        character.bankAccount = bankAccount ?? ""
        character.agency = agency ?? ""
        character.balance = balance ?? 0.0
        return character
    }
    
}
