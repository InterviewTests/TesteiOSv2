//
//  UserLogin.swift
//  TesteiOSV2_Rafael_Hieda
//
//  Created by Rafael  Hieda on 10/27/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import UIKit

class UserLogin: NSObject
{
    var login : String
    var password : String
    
    init(_ login:String, password:String)
    {
        self.login = login
        self.password = password
    }
    
    func hasValidPassword() -> Bool
    {
        return passwordHasCapitalLetters()
            && passwordHasNumbers()
            && passwordHasSpecialCharacters()
    }
    
    func passwordHasCapitalLetters() -> Bool
    {
        return passwordContainsPattern("[A-Z]")
    }
    
    func passwordHasNumbers() -> Bool
    {
        return passwordContainsPattern("[0-9]")
    }
    
    func passwordHasSpecialCharacters() -> Bool
    {
        return passwordContainsPattern("[^A-Za-z0-9]")
    }
    private func passwordContainsPattern(_ regexPattern : String) -> Bool
    {
        if let _ : String = password
        {
            if String(password).range(of: regexPattern, options: .regularExpression) != nil
            {
                return true
            }
            else
            {
                return false
            }
        }
        return false
    }
}
