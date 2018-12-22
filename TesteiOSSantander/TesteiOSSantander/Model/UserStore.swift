//
//  UserStore.swift
//  TesteiOSSantander
//
//  Created by Gersinho on 21/12/18.
//  Copyright © 2018 julio.c.tanchiva. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class UserStore: NSObject{
    static let singgleton = UserStore()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: "bfoo", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1]
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator =
        {
            let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
            let url = self.applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite")
            
            do {
                try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
            } catch {
                let dict : [String : Any] = [NSLocalizedDescriptionKey        : "Failed to initialize the application's saved data" as NSString,
                                             NSLocalizedFailureReasonErrorKey : "There was an error creating or loading the application's saved data." as NSString,
                                             NSUnderlyingErrorKey             : error as NSError]
                let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
                print("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
                abort()
            }
            
            return coordinator
    }()
    

    
    @available(iOS 10.0, *)
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TesteiOSSantander")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    @available(iOS 9.0, *)
    lazy var managedObjectContext: NSManagedObjectContext = {
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
        return managedObjectContext
    }()
    // MARK: - Core Data context
    lazy var databaseContext : NSManagedObjectContext = {
        if #available(iOS 10.0, *) {
            return self.persistentContainer.viewContext
        } else {
            return self.managedObjectContext
        }
    }()
    
    private override init() {
        super.init()
    }
    
    func creatUser()-> LocalUser{
        return NSEntityDescription.insertNewObject(forEntityName: "LocalUser", into: databaseContext) as! LocalUser
    }
    
    func salvarUser(){
        do {
            return try self.databaseContext.save()
        }catch{
            print("Erro ao salvar user: \(error)")
        }
    }
    
    
    func getUser() ->[LocalUser]{
        let fetchResquest = NSFetchRequest<NSFetchRequestResult>(entityName: "LocalUser")
        do {
            return try self.databaseContext.fetch(fetchResquest) as! [LocalUser]
        }catch {
            print("Erro ao pegar os salvos: \(error)")
            return[]
        }
    }
    
    func salvar(user: String){
        
        var userData: LocalUser!
        
        if getUser().isEmpty {
            userData = creatUser()
            userData.username = user
        }
        self.salvarUser()
    }
    
    
    func deleteAllData()
    {
        let managedContext = databaseContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"LocalUser")
        fetchRequest.returnsObjectsAsFaults = false
        
        do
        {
            let results = try managedContext.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                managedContext.delete(managedObjectData)
            }
        } catch let error as NSError {
            print("Detele all data in LocalUser error : \(error) \(error.userInfo)")
        }
    }
    
    
    
    
}
