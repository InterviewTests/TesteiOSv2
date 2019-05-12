//
//  StatementsModels.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

import UIKit

enum StatementsModel {
    enum Header {
        struct Request{
            var headerData: UserAccount?
        }
        
        struct Response{
            var headerData: UserAccount?
        }
        
        struct ViewModel{
            var name: String
            var account: String
            var balance: String
        }
    }
    
    enum Fetch {
        struct Response {
            let statements: StatementList?
        }
        
        struct ViewModel {
            let statementEntries: [Statement]
        }
    }
}
