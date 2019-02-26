//
//  BankDAO.swift
//  TesteiOSv2
//
//  Created by Capgemini on 26/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//
import UIKit
import CoreData

class BankDAO {
    private static let USER_MODEL = "UserModel"
    
    static func save(_ login : String){
        if #available(iOS 10.0, *) {
            guard let context = getContext() else {return}
            let entity = NSEntityDescription.entity(forEntityName: USER_MODEL, in: context)
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            newUser.setValue(1, forKey: "id")
            newUser.setValue(login, forKey: "login")
            do {
                try context.save()
            } catch {
                print("Failed saving")
            }
        }
    }
    
    static func get() -> String? {
        if #available(iOS 10.0, *) {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserModel")
            request.predicate = NSPredicate(format: "id = %@", "1")
            request.returnsObjectsAsFaults = false
            
            do {
                let result = try self.getContext()?.fetch(request)
                var login = ""
                for data in result as! [NSManagedObject] {
                    login = data.value(forKey: "login") as! String
                }
                return login
            } catch {
                print("Failed")
            }
        }
        return nil
    }
    private static func getContext() -> NSManagedObjectContext? {
        if #available(iOS 10.0, *) {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            guard let context = appDelegate.persistentContainer?.viewContext else {return nil}
            return context
        }
        return nil
    }
    
}
