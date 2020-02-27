//
//  StatementsController.swift
//  SANTANDER
//
//  Created by Maíra Preto on 27/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//
import Foundation

protocol StatementsControllerDelegate: class {
    
    func successLoadStatements()
    func errorLoadStatements(error: Error?)
}

class StatementsController {
    
    weak var delegate: StatementsControllerDelegate?
    
    var provider: StatementsProvider?
    
    var arrayList: List?
    
    func setupController(){
        self.provider = StatementsProvider()
        self.provider?.delegateStatements = self
    }
    
    func loadList() {
        self.setupController()
        self.provider?.loadStatements()
    }
    
    func numberOfRowsInSection() -> Int {
        return self.arrayList?.count ?? 0
    }
    
    func loadCurrentMovie(indexPath: IndexPath) -> StatementList {
        
        return (self.arrayList?[indexPath.row])!
    }
}

extension StatementsController: StatementsProviderDelegate {
    
   
    
    func successLoadStatements(lists: List) {
        guard self.arrayList != nil else {
        self.arrayList = lists
         self.delegate?.successLoadStatements()
        return
        }
        self.arrayList?.append(contentsOf: lists)
    }
    
    func errorLoadStatements(error: Error?) {
           self.delegate?.errorLoadStatements(error: error)
       }
    
}

