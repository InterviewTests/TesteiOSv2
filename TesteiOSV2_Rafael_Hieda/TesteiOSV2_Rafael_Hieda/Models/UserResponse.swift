//
//  UserResponse.swift
//  TesteiOSV2_Rafael_Hieda
//
//  Created by Rafael  Hieda on 10/27/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import UIKit

class UserResponse: NSObject {
    
    var userAccount : UserAccount
    var error : LoginError
    
    init(account : UserAccount, error : LoginError)
    {
        self.userAccount = account
        self.error = error
    }
    
}
