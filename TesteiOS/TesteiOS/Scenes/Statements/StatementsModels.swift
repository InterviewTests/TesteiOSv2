//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright (c) 2019 Fabio Morais. All rights reserved.
//
//  Type "usecase" for some magic!


enum StatementsModel {
    enum Header {
        struct Request {
            var headerDataResponse: AccountDetail?
        }
        
        struct Response {
            var headerDataResponse: AccountDetail?
        }
        
        struct ViewModel {
            var name: String
            var account: String
            var balance: String
        }
    }
    
    enum Fetch {
        struct Response {
            let statements: Statement?
        }
        
        struct ViewModel {
            let statementEntries: [StatementList]
        }
    }
}
