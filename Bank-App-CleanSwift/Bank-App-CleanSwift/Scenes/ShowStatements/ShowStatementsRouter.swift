//
//  ShowStatementsRouter.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import Foundation


protocol ShowStatementsRoutingLogic {
    func dismissScreen()
}

protocol ShowStatementsDataPassing {
    var dataStore: ShowStatementsDataStore? { get }
}

class ShowStatementsRouter: NSObject, ShowStatementsRoutingLogic, ShowStatementsDataPassing {
    var dataStore: ShowStatementsDataStore?
    var viewController: ShowStatementsViewController?
    
    func dismissScreen() {
        viewController?.navigationController?.popViewController(animated: true)
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    
        
}
