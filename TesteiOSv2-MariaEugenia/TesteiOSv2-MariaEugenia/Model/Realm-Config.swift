//
//  Realm-Config.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 13/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import RealmSwift

public protocol Persistable {
    associatedtype ManagedObject: RealmSwift.Object
    init(managedObject: ManagedObject)
    func managedObject() -> ManagedObject
}

public final class WriteTransaction {
    private let realm: Realm
    internal init(realm: Realm) {
        self.realm = realm
    }
    public func add<T: Persistable>(_ value: T, update: Bool) {
        realm.add(value.managedObject(), update: update)
    }
    
    public func delete<T: Persistable>(_ value: T) {
        realm.delete(value.managedObject())
    }
}

public final class FetchedResults<T: Persistable> {
    internal let results: Results<T.ManagedObject>
    public var count: Int {
        return results.count
    }
    internal init(results: Results<T.ManagedObject>) {
        self.results = results
    }
    public func value(at index: Int) -> T {
        return T(managedObject: results[index])
    }
}

public final class Container {
    private let realm: Realm
    public convenience init() throws {
        try self.init(realm: Realm())
    }
    internal init(realm: Realm) {
        self.realm = realm
    }
    public func write(_ block: (WriteTransaction) throws -> Void)
        throws {
            let transaction = WriteTransaction(realm: realm)
            try realm.write {
                try block(transaction)
            }
    }
    public func values<T: Persistable> (_ type: T.Type) -> FetchedResults<T> {
        let results = realm.objects(T.ManagedObject.self)
        return FetchedResults(results: results)
    }
}
