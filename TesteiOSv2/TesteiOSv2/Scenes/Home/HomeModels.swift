//
//  HomeModels.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 20/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit


enum HomeModel {
    struct Request {
    }
    struct Response {
        var statements: [Statement]?
        var isError: Bool
        var messageError: String?
    }
    struct StatementViewModel {
        let title: String
        let detail: String
        let date: String
        let value: String
    }
    struct ResponseUser {
        let user: User
    }
    struct UserViewModel {
        let name: String
        let account: String
        let balance: String
    }
  
    
}
