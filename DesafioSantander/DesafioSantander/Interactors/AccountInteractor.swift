//
//  AccountInteractor.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 29/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import Foundation

class AccountInteractor {
    
    var presenter: AccountPresentationLogic?
    
    func fetchStatements(userId: Int) {
        let service = AccountService()
        
        RKLoading.showLoading()
        service.statements(userId: userId) { [unowned self] (data, response, error) in
            RKLoading.hideLoading()
            
            var error: Error?
            guard error == nil else {
                error = NSError(domain: "DesafioSantander", code: -1050, userInfo: [NSLocalizedDescriptionKey : "Ocorreu um erro ao tentar efetuar buscar statements."])
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, !acceptableStatusCodes.contains(httpResponse.statusCode) {
                error = NSError(domain: "DesafioSantander", code: -1050, userInfo: [NSLocalizedDescriptionKey : "Ocorreu um erro ao tentar efetuar buscar statements."])
                return
            }
            
            let listOfStatements = try? JSONDecoder().decode(ListOfStatements.self, from: data!)
            self.presenter?.presentStatementsFetched(listOfStatements?.statementList ?? [Statement](), error)
        }
    }
    
}
