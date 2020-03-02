//
//  StatementsController.swift
//  SANTANDER
//
//  Created by Maíra Preto on 27/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//
import Foundation

protocol StatementsControllerProtocol: class {
    func didFinishRequest(array: [StatementList])
}

class StatementsController {

    var provider: StatementsProvider = StatementsProvider()
    weak var delegate: StatementsControllerProtocol?
    
    func loadList() {
        provider.getDataFromHeroKu { (array) in
            if let arrayStatement = array {
                self.delegate?.didFinishRequest(array: arrayStatement)
            }
        }
        return
    }
}

