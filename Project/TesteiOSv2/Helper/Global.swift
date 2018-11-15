//
//  Global.swift
//  TesteiOSv2
//
//  Created by Macintosh on 15/11/18.
//  Copyright © 2018 Roney Sampaio. All rights reserved.
//


import UIKit

class Global: NSObject {
    
    
    struct Constants {
        static let accountDetailsStoryboardID = "AccountDetails"
    }
    
    
    enum RestAPI : String {
        case baseURL = "https://bank-app-test.herokuapp.com/api/"
        case requestLogin = "login/"
        case requestStatements = "statements/"
    }
    
    
    enum RestParams {
        
        enum LoginRequest : String {
            case kUserAccount = "userAccount"
            case kAgency = "agency"
            case kBalance = "balance"
            case kBankAccount = "bankAccount"
            case kName = "name"
            case kUserID = "userId"
        }
        
        enum StatementRequest : String {
            case kStatementList = "statementList"
            case kDate = "date"
            case kDescription = "desc"
            case kTitle = "title"
            case kValue = "value"
        }
        
        enum ErrorRequest : String {
            case kError = "error"
            case kErrorMsg = "message"
        }
        
    }
    
    enum UserDefaults : String {
        case userID = "userID"
    }
    
}
