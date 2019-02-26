//
//  LoginModels.swift
//  TesteiOSv2
//
//  Created by Capgemini on 22/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//
import Foundation

enum FetchUsers {
    
    
    struct UserFormFields {
        var user: String
        var password: String
        func getData() -> Data? {
            return "user=\(user)&password=\(password)".data(using: .utf8)
        }
    }
    
    
    
    enum FetchUsers {
        struct Request {
            var userFormFields: UserFormFields
        }
        struct Response {
            var user : User?
        }
        struct ViewModel {
            var user : User?
            var error: String?
        }
    }
}




//enum ListOrders
//{
//    // MARK: Use cases
//
//    enum FetchOrders
//    {
//        struct Request
//        {
//        }
//        struct Response
//        {
//            var orders: [Order]
//        }
//        struct ViewModel
//        {
//            struct DisplayedOrder
//            {
//                var id: String
//                var date: String
//                var email: String
//                var name: String
//                var total: String
//            }
//            var displayedOrders: [DisplayedOrder]
//        }
//    }
//}
