//
//  LoginModels.swift
//  TesteSantander
//
//  Created by Hugo Abolis Jordao on 13/06/19.
//  Copyright (c) 2019 Hugo Abolis Jordao. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Login
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request
    {
        let data: [String: String]
        
    }
    struct Response: Decodable
    {
        var userAccount: UserData?
        var error: ErrorData?
    }
    struct ViewModel
    {
        var userAccount: UserData?
        var errorMessage: String?
    }
    
    struct UserData: Decodable{
        let userId: Int?
        let name: String?
        let bankAccount: String?
        let agency: String?
        let balance: Float?
    }
    
    struct ErrorData: Decodable{
        var code: Int?
        var message: String?
    }
  }
}
