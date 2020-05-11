//
//  ShowUserModels.swift
//  TesteSantader
//
//  Created by Bruno Chen on 06/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

enum ShowUser {
    // MARK: - Use cases
    
    enum ShowGreeting {
        
        struct Request {
            
        }
        
        struct Response {
            var userData: UserData
        }
        
        struct ViewModel: Equatable {
            var name: String
            var bankAgency: String
            var account: String
            var balance: String
        }
        
    }
    
    enum ShowStatementList {
        
        struct Request {
            var userID: String
        }
        
        struct Response: Equatable
        {
            var statementList: [StatementList]
        }
        
        struct ViewModel: Equatable {
            
            struct DisplayedStatement: Equatable {
                var title: String
                var desc: String
                var date: String
                var value: Double
            }
            var displayedStatement: [DisplayedStatement]
        }
        
    }
    
}

func ==(lhs: ShowUser.ShowStatementList.Response, rhs: ShowUser.ShowStatementList.Response) -> Bool
{
  return lhs.statementList == rhs.statementList
}

func ==(lhs: ShowUser.ShowGreeting.ViewModel, rhs: ShowUser.ShowGreeting.ViewModel) -> Bool
{
  return lhs.name == rhs.name
    && lhs.bankAgency == rhs.bankAgency
    && lhs.account == rhs.account
    && lhs.balance == rhs.balance
}

func ==(lhs: ShowUser.ShowStatementList.ViewModel, rhs: ShowUser.ShowStatementList.ViewModel) -> Bool
{
    return lhs.displayedStatement == rhs.displayedStatement

}

func ==(lhs: ShowUser.ShowStatementList.ViewModel.DisplayedStatement, rhs: ShowUser.ShowStatementList.ViewModel.DisplayedStatement) -> Bool
{
  return lhs.title == rhs.title
    && lhs.desc == rhs.desc
    && lhs.date == rhs.date
    && lhs.value == rhs.value
}
