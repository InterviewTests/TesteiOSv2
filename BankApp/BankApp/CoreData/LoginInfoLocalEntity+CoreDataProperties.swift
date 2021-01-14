//
//  LoginInfoLocalEntity+CoreDataProperties.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/13/21.
//
//

import Foundation
import CoreData


extension LoginInfoLocalEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoginInfoLocalEntity> {
        return NSFetchRequest<LoginInfoLocalEntity>(entityName: "LoginInfoLocalEntity")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?

}

extension LoginInfoLocalEntity : Identifiable {

}
