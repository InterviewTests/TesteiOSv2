//
//  TesteAPIManager.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 11/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import enum Result.Result

typealias ErrorBlock = ((String?) -> Void)

private func JSONResponseDataFormatter(data: Data) -> Data {
    
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data //fallback to original data if it cant be serialized
    }
    
}


struct TesteAPIManager {
    
    static let shared = TesteAPIManager()
    static let provider = MoyaProvider<TesteAPI>(plugins: [
        NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)
        ])
}

extension TesteAPIManager {
    
    fileprivate func request<T: Decodable>(_ target: TesteAPI, type: T.Type, failure: ErrorBlock?, completion: ((T?) -> Void)?) {
        
        TesteAPIManager.provider.request(target) { (result) in
            if self.handleResult(result: result, failure: failure) {
                do {
                    let value = try result.value?.map(type)
                    completion?(value)
                } catch {
                    failure?(nil)
                }
            }
        }
    }
    
    private func handleResult(result: Result<Moya.Response, MoyaError>, failure: ErrorBlock?) -> Bool {

        switch result {
        case let .success(response):
            if response.responseClass == .success { return true }
            else { return false }
    
        case let .failure(error):
            guard let error = error as? CustomStringConvertible else {
                failure?(nil)
                return false
            }
            
            var errorString: String? = error.description
            if errorString?.lowercased().contains("moyaerror") ?? false {
                errorString = nil
            }
            
            failure?(errorString)
            
        }
        
        return false
    }
    
}

protocol TesteAPICalls {
    
    func login(withLogin login: String, andPassword password: String, failure: @escaping ErrorBlock, completion: @escaping (LoginModel?) -> Void)
    
    func getStatments(failure: @escaping ErrorBlock, completion: @escaping (StatementModel?) -> Void)
}

extension TesteAPIManager: TesteAPICalls {
    
    func login(withLogin login: String, andPassword password: String, failure: @escaping ErrorBlock, completion: @escaping (LoginModel?) -> Void) {
        request(.login(login: login, password: password), type: LoginModel.self, failure: failure, completion: completion)
    }
    
    func getStatments(failure: @escaping ErrorBlock, completion: @escaping (StatementModel?) -> Void) {
        request(.statements, type: StatementModel.self, failure: failure, completion: completion)
    }
}

public enum ResponseClass {
    case informational
    case success
    case redirection
    case clientError
    case serverError
    case undefined
    
    public init(statusCode: Int) {
        switch statusCode {
        case 100 ..< 200:
            self = .informational
        case 200 ..< 300:
            self = .success
        case 300 ..< 400:
            self = .redirection
        case 400 ..< 500:
            self = .clientError
        case 500 ..< 600:
            self = .serverError
        default:
            self = .undefined
        }
    }
}

public extension Response {
    
    public var responseClass: ResponseClass {
        return ResponseClass(statusCode: self.statusCode)
    }
    
}
