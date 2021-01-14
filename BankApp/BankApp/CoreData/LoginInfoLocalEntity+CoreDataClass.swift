//
//  LoginInfoLocalEntity+CoreDataClass.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/13/21.
//
//

import UIKit
import CoreData

@objc(LoginInfoLocalEntity)
public class LoginInfoLocalEntity: NSManagedObject {
    
    private static var manageContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    static func clear() {
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: LoginInfoLocalEntity.fetchRequest())
        
        do {
            try manageContext.execute(deleteRequest)
        } catch {
            print("Falha ao deletar todos os dados da entity", error.localizedDescription)
        }
    }
    
    static func fetchAll() -> [LoginInfoLocalEntity]? {
        let request: NSFetchRequest<LoginInfoLocalEntity> = LoginInfoLocalEntity.fetchRequest()
        
        do {
            let localObjects = try manageContext.fetch(request)
            return localObjects
        }
        catch { print(error.localizedDescription) }

        return nil
    }
    
    func save() {
        LoginInfoLocalEntity.clear()
        
        do {
            try LoginInfoLocalEntity.manageContext.save()
        } catch {
            print("Falha ao salvar objeto", error.localizedDescription)
        }
    }

//    func delete() {
//        LoginInfoLocalEntity.manageContext.delete(self)
//        self.save()
//    }
}
