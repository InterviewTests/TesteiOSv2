//
//  StatementsModels.swift
//  TesteiOSv2
//
//  Created by Jose Neves on 11/01/19.
//  Copyright © 2019 joseneves. All rights reserved.
//

import UIKit

enum Statements {
    struct StatementsFormFields {
        var title: String
        var desc: String
        var date: String
        var value: Float
    }
    
    enum GetStatements {
        struct Request {
        }
        
        struct Response {
            var statements: [Statement]?
        }
        
        struct ViewModel {
            var statements: [Statement]?
        }
    }
}
