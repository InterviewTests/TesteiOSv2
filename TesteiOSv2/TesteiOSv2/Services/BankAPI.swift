//
//  BankAPI.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 12/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation
import Moya

enum BankAPI {
  case login(username: String, password: String)
  case statements(userId: String)
}

extension BankAPI: TargetType {
  var environmentBaseURL: String {
    switch NetworkManager.environment {
    case .staging:
      return "https://bank-app-test.herokuapp.com/api"
    case .qa:
      return ""
    case .production:
      return ""
    }
  }
  
  var baseURL: URL {
    guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.") }
    return url
  }
  
  var path: String {
    switch self {
    case .login:
      return "/login"
    case .statements(let userId):
      return "/statements/\(userId)"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .login:
      return .post
    case .statements:
      return .get
    }
  }
  
  var task: Task {
    switch self {
    case .login(let user, let password):
      return .requestParameters(parameters: ["user": user, "password": password], encoding: URLEncoding.httpBody)
    case .statements(let userId):
      return .requestParameters(parameters: ["userId": userId], encoding: URLEncoding.queryString)
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .login:
      return ["Content-type": "application/x-www-form-urlencoded"]
    case .statements:
      return ["Content-type":"application/json"]
    }
  }
  
}
