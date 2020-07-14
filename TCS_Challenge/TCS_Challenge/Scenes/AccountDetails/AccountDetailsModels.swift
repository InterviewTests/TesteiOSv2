//
//  AccountDetailsModels.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

enum AccountDetails {
    
    struct AccountInfo {
        var userId: Int?
        var name: String?
        var bankAccount: String?
        var agency: String?
        var balance: Double?
    }
    
    // MARK: Use cases
    
    enum FetchStatements {
        
        struct Request {
            let userId: Int
        }
        
        struct Response: Codable {
            var title: String?
            var desc: String?
            var date: String?
            var value: Double?
        }
        
        struct ViewModel {
            struct DisplayedStatement {
                var title: String
                var desc: String
                var date: String
                var value: String
            }
            var displayedStatements: [DisplayedStatement]
        }
    }
    
}
