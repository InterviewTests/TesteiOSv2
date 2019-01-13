//
//  NetworkManager.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 12/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum APIEnvironment {
  case staging
  case qa
  case production
}

protocol Networkable {
  var provider: MoyaProvider<BankAPI> { get }
  func login(request: Login.Request, completion: @escaping (Result<User, LoginError>) -> ())
  
}

struct NetworkManager: Networkable {
  let provider = MoyaProvider<BankAPI>(manager: DefaultAlamofireManager.sharedManager, plugins: [NetworkLoggerPlugin(verbose: true)])
  static let environment: APIEnvironment = .staging
  
  func login(request: Login.Request, completion: @escaping (Result<User, LoginError>) -> ()) {
      provider.request(.login(username: request.username, password: request.password)) { result in
        switch result {
        case .success(let response):
          do {
            let userData = try JSONDecoder().decode(UserAccount.self, from: response.data)
            let result = Result<User, LoginError>.success(userData.user!)
            completion(result)
          } catch let error {
            fatalError("data could not be decoded: \(error)")
          }
        case .failure:
          let result: Result<User, LoginError>
          if Connectivity.isConnectedToInternet() {
            result = Result<User, LoginError>.failure(LoginError.networkFailure)
          } else {
            result = Result<User, LoginError>.failure(LoginError.noInternetConnection)
          }
          completion(result)
        }
      }
  }
}
