//
//  StatementsModels.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

enum StatementsModels {
    struct StatementEntity {
        let title: String
        let desc: String
        let date: String //"2018-08-15"
        let value: Float
        
        init?(statement: StatementStruct) {
            guard
                let title = statement.title,
                let desc = statement.desc,
                let date = statement.date,
                let value = statement.value
                else { return nil }
            
            self.title = title
            self.desc = desc
            self.date = date
            self.value = value
        }
    }
    
    struct Response {
        var statementsList: [StatementEntity]
    }
    
    struct ViewModel {
        struct StatementViewModel {
          var title: String
          var description: String
          var date: String
          var value: String
        }
        
        var statements: [StatementViewModel]
        var numStatements: Int { return statements.count }
        
        func at(_ index: Int) -> StatementViewModel {
            return statements[index]
        }
    }
}
