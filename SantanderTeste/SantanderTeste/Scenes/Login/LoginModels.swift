//
//  LoginModels.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 17/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation
import UIKit

enum Login
{
    // MARK: Use cases
    
    enum fetchlogin
    {
        struct Request
        {
            let user: String
            let password: String
            
        }
        struct Response
        {
            let LoginResponse: UserModel?
            let message: String?
        }
        struct ViewModel
        {
            struct DisplayViewModel {
                let userId: String
                let name: String
                let bankAccount: String
                let agency: String
                let balance: String
            }
            var displayLogin: DisplayViewModel 
        }
    }
}
