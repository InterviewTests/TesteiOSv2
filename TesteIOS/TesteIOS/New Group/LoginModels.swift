//
//  LoginModels.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 21/01/19.
//  Copyright (c) 2019 ti alto nivel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Login
{
  enum doLogin
  {
    struct Request
    {
        var user: String
        var password: String
    }
    struct Response
    {
        var userAccount: UserAccount?
    }
    struct ViewModel
    {
        var withIdentifier: String
        var vController: UIViewController
        func viewController () ->UIViewController {
            return vController
        }
    }
  }
}
