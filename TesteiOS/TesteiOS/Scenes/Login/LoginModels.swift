//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright (c) 2019 Fabio Morais. All rights reserved.
//
//  Type "usecase" for some magic!


import UIKit

enum LoginModel {
  enum Login {
    struct Request {
      let userId: String?
      let password: String?
    
      func getBody() -> String {
        return "user=\(userId ?? "")&password=\(password ?? "")"
      }
    }
    
    struct Response {
      let user: UserAccount?
    }
    
    struct ViewModel {
      let name: String
      let banckAccount: String
      let agency: String
      let balance: Double
    }
  }
}
