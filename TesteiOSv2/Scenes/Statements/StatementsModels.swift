//
//  StatementsModels.swift
//  TesteiOSv2
//
//  Created by Capgemini on 24/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//




enum ListStatements {
    
    enum FetchStatements {
        
        struct Request
        {
            var user : User
        }
        struct Response
        {
            var statements: [Statement]
        }
        struct ViewModel
        {
            struct UserDisplayed
            {
                var name: String
                var account: String
                var balance: String
            }
            struct StatementDisplayed {
                var title: String
                var desc : String
                var date : String
                var value : String
            }
            var userDisplayed : UserDisplayed
            var statementsDisplayed: [StatementDisplayed]
        }
    }
    
}
