//
//  NetworkManager.swift
//  TestSantander-IBM
//
//  Created by Renato Carvalhan on 24/01/19.
//  Copyright © 2019 Renato Carvalhan. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

enum Result<String> {
    case success
    case failure(String)
}

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request."
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response"
}

struct NetworkManager {
    static let environment: NetworkEnvironment = .production
    let router = Router<Api>()
    
    func login(request: LoginScene.Login.Request, completion: @escaping (LoginScene.Login.Response?, String?) -> ()){
        router.request(.userAccount(userAccount: request.userAccount, password: request.password)){ (response, error) in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response {
                let result = self.handleNetworkResponse(response.response!)
                
                switch result {
                case .success:
                    guard let dic = response.value as? [String: Any] else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    if let dicUserAccount = dic["userAccount"] as? [String: Any] {
                        if let user = Mapper<UserAccount>().map(JSON: dicUserAccount) {
                            completion(LoginScene.Login.Response(userAccount: user, error: nil), nil)
                        }
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func getStatements(request: StatementScene.GetStatements.Request, completion: @escaping (StatementScene.GetStatements.Response?, String?) -> ()){
        router.request(.statements(id: request.id)) { (response, error) in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response {
                let result = self.handleNetworkResponse(response.response!)
                
                switch result {
                case .success:
                    guard let dict = response.result.value as? [String: Any] else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    if let dataList = dict["statementList"] as? [[String: Any]] {
                        let statements = dataList.compactMap {
                            return Mapper<Statement>().map(JSON: $0)
                        }
                        completion(StatementScene.GetStatements.Response(statements: statements, error: nil), nil)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
