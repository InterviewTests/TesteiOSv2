//
//  APIManager.swift
//  TesteiOSv2
//
//  Created by Bruno on 09/11/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import Foundation

protocol APIServiceProtocol {
    func fetchStatements(of user: User, completion: @escaping(Result<[Statement]>) -> Void)
    func performLogin(withUserName userName: String, password: String, completion: @escaping(Result<User>) -> Void)
}

class MockAPIService: APIServiceProtocol {
    func fetchStatements(of user: User, completion: @escaping (Result<[Statement]>) -> Void) {
        let statement = Statement.init(title: "Test", desc: "test", date: "test", value: 200)
        completion(.success([statement]))
    }
    
    func performLogin(withUserName userName: String, password: String, completion: @escaping (Result<User>) -> Void) {
        let user = User.init(userId: 1, name: "test", bankAccount: "test", agency: "test", balance: 200)
        completion(.success(user))
    }
}

private let basePath: String = "https://bank-app-test.herokuapp.com/api"
private let loginPath: String = basePath + "/login"
private let statementsPath: String = basePath + "/statements/"

struct APIKeys {
    static let user = "user"
    static let password = "password"
}

final class APIService: APIServiceProtocol {
    private let session: URLSession
    
    init(_ session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchStatements(of user: User, completion: @escaping(Result<[Statement]>) -> Void) {
        let path = statementsPath + "\(user.userId)"
        
        guard let url = URL(string: path) else {
            completion(.failure(CustomError.internetConnection))
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(CustomError.internetConnection))
                return
            }
            
            do {
                let statements = try JSONDecoder().decode(StatementContainer.self, from: data).statementList
                completion(.success(statements))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func performLogin(withUserName userName: String, password: String, completion: @escaping(Result<User>) -> Void) {
        let params = [
            APIKeys.user: userName,
            APIKeys.password: password
        ]
        
        guard let request = buildPostRequest(withPath: loginPath, parameters: params) else {
            completion(.failure(CustomError.internetConnection))
            return
        }
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(.failure(CustomError.internetConnection))
                return
            }
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    private func buildPostRequest(withPath path: String, parameters: [String: String]) -> URLRequest? {
        guard let url = URL(string: path) else { return nil }
        
        var request = URLRequest(url: url)
        request.encodeParameters(parameters: parameters)
        
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        return request
    }
}

enum Result<T> {
    case success(T)
    case failure(Error)
}
