//
//  StatementsInteractor.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

class StatementsInteractor {
    
    var presenter: StatementsPresenterProtocol?
    
    
    
}

// MARK: - Access from View

extension StatementsInteractor: StatementsInteractorProtocol {
    func viewDidLoad() {
        // TODO: exibir informações do usuario
        
        // TODO: fetch de historico
    }
    
    func logout() {
        // TODO: retornar para tela inicial
        
        // TODO: remover informações salvas localmente
    }
}
