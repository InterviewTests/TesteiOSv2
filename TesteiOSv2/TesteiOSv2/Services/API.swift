//
//  API.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 16/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

struct API {
  private static var baseUrlString: String {
    return "https://bank-app-test.herokuapp.com"
  }

  private static var baseUrl: URL {
    guard let url = URL(string: baseUrlString) else { fatalError("invalid base url") }
    return url
  }

  enum Endpoints: String {
    case login = "/api/login"
    case statements = "/api/statements/1"
  }

  static func login(request: Login.SubmitLogin.Request, completion: @escaping (Login.SubmitLogin.Response) -> Void) {
    let parameters = LoginAPIRequest(user: request.fields.user ?? "", password: request.fields.password ?? "")
    let method = Method.post
    let path = Endpoints.login.rawValue
    HTTPService.request(method: method, baseUrl: baseUrl, path: path, parameters: parameters) { callback in
      do {
        let data = try callback()
        let apiResponse = try JSONDecoder().decode(LoginAPIResponse.self, from: data)
        let response = Login.SubmitLogin.Response(userAccount: apiResponse.userAccount)
        completion(response)
      } catch {
        let response = Login.SubmitLogin.Response(userAccount: nil, error: error as? ErrorProtocol)
        completion(response)
      }
    }
  }

  static func getStatements(completion: @escaping (Account.FetchStatements.Response) -> Void) {
    let method = Method.get
    let path = Endpoints.statements.rawValue
    HTTPService.request(method: method, baseUrl: baseUrl, path: path) { callback in
      do {
        let data = try callback()
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.apiDateFormatter)
        let apiResponse = try decoder.decode(StatementAPIResponse.self, from: data)
        let response = Account.FetchStatements.Response(statements: apiResponse.statements)
        completion(response)
      } catch {
        let response = Account.FetchStatements.Response(statements: [])
        completion(response)
      }
    }
  }
}
