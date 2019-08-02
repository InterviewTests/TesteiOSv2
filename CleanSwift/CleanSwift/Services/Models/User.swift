//
//  User.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var username: String = ""
    @objc dynamic var token: String = ""
    
    override static func primaryKey() -> String {
        return "username"
    }
}
