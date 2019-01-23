//
//  LoginRepository.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 22/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import Foundation
import RealmSwift

class UserRepository {
    static let shared = UserRepository()
    var realm: Realm

    private init() {
        /* let defaultPath = Realm.Configuration.defaultConfiguration.fileURL
         try! FileManager.default.removeItem(atPath: (defaultPath?.absoluteString)!) */
        let config = Realm.Configuration(schemaVersion: 5, migrationBlock: { _, oldSchemaVersion in
            // We haven’t migrated anything yet, so oldSchemaVersion == 0
            if oldSchemaVersion < 4 {
                // Nothing to do!
                // Realm will automatically detect new properties and removed properties
                // And will update the schema on disk automatically
            }
        }, objectTypes: [UserAccount.self])
        realm = try! Realm(configuration: config)
    }

    func saveUser(userAccount: UserAccount) {
        print("star--", userAccount.print(), "--end")
        try! realm.write {
            realm.deleteAll()
            realm.add(userAccount)
        }
    }

    func getUser(callback: @escaping (_ user: UserAccount?) -> Void) {
        try! realm.write {
            let users = realm.objects(UserAccount.self)
            callback(users.last)
        }
    }
}
