//
//  LoginModels.swift
//  BankInterviewApp
//
//  Created by Osias Carneiro on 10/03/20.
//  Copyright (c) 2020 Osias Carneiro. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Login
{
  // MARK: Use cases
    struct Request
    {
        var user: String
        var password: String
    }
    struct Error
    {
        var message: String
    }
    struct Response
    {
        var id: Int
        var name: String
        var agency: String
        var account: String
        var balance: Float
    }
    struct ViewModel
    {
        var id: Int
        var name: String
        var agency: String
        var account: String
        var balance: Float
    }
}
