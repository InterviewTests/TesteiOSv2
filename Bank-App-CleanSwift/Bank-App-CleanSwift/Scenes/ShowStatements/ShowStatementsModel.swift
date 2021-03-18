//
//  ShowStatementsModel.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import Foundation

enum ShowStatements {
    struct ShowStatementsFields {
        var name: String
        var accountWithAgency: String
        var balance: String
    }
    
    enum ShowStatements {
        struct Request {
            var userAccount: UserAccount?
        }
        
        struct Response {
            var userAccount: UserAccount?
        }
        
        struct ViewModel {
            var fields: ShowStatementsFields
        }
    }
}


