//
//  StatementModels.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/13/21.
//

import Foundation

enum ListStatement {
  // MARK: Use cases
  
  enum FetchStatement {
//    struct Request { }
    
    struct Response {
      var statementList: [StatementStruct]
    }
    
    struct ViewModel {
      struct DisplayedStatement {
        var title: String
        var description: String
        var date: String
        var value: String
      }
      var displayedStatements: [DisplayedStatement]
    }
    
  }
}

struct UserInfoViewModel {
    let name: String
    let account: String
    let balance: String
}
