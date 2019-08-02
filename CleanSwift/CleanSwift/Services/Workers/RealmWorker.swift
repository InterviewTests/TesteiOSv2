//
//  RealmWorker.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import RealmSwift

class RealmWorker {
    let realm = try? Realm()
    
    func saveObjc(obj: Object) {
        try? realm!.write {
            realm?.add(obj, update: false)
        }
    }
    
    func deleteObj(obj: User) {
        try? realm!.write {
            realm!.delete(obj)
        }
    }
    
    func getObj() -> User? {
        let obj = realm!.objects(User.self)
        return obj.first
    }
}
