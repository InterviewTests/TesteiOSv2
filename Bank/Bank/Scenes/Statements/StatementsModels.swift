//
//  StatementsModels.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright (c) 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit

enum Statements {
    
    struct Request {
        var userAccount: UserAccount?
    }
    
    struct Response {
        var userLogin: UserLogin?
        var statementList: StatementList?
        var error: ErrorHandler?
    }
    
    struct ViewModel {
        var userLogin: UserLogin?
        var error: ErrorHandler?
        var statementList: StatementList?
    }
    
    
}
