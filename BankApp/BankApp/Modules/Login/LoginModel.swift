//
//  LoginModel.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/13/21.
//

import Foundation

enum LoginModels {
  //struct Request { }
  
  struct Response {
    //var loginResponse: LoginResponseStruct
  }
  
  struct ViewModel {
    struct DisplayedOrder {
      var id: String
      var date: String
      var email: String
      var name: String
      var total: String
    }
    var displayedOrders: [DisplayedOrder]
  }
  
}
