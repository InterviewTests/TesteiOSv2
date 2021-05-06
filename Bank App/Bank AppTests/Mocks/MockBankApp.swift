//
//  MockBankApp.swift
//  Bank AppTests
//
//  Created by Christian Castro on 03/05/21.
//

import Foundation
@testable import Bank_App

private var dataTask: URLSessionDataTask?
private let decoder = JSONDecoder()

class MockBankApp {
    var shouldReturnError = false
    var loginWasCalled = false
    var requestWasCalled = false
    
    enum MockServiceError: Error {
        case login
        case request
    }
    func reset() {
        shouldReturnError = false
        loginWasCalled = false
        requestWasCalled = false
    }
    
    convenience init() {
        self.init(false)
    }
    
    init(_ shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    func checkUsersField(user: String) -> Bool {
        let isValidUser = Validator.validateUser(user: user)
        return isValidUser
    }
    
    func checkPasswordField(password: String) -> Bool {
        let isValidPassword = Validator.validatePassword(password: password)
        return isValidPassword
    }
    
    func setErrorMessage(user: String, password: String) -> String {
        let isValidUser = checkUsersField(user: user)
        let isValidPassword = checkPasswordField(password: password)
        var message = ""
        if user.isEmpty && password.isEmpty {
            message = ""
        } else if isValidUser && password.isEmpty {
            message = ""
        } else if user.isEmpty && isValidPassword {
            message = ""
        } else if !isValidUser {
            message = "Please, enter a valid email adress or a valid CPF number."
        } else if !isValidPassword {
            message = "Enter a password with numbers, uppercase and special characters"
        }
        return message
    }
}

extension MockBankApp: BankApiProtocol {
    var path: String {
        return ""
    }
    
    func login(path: String, user: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        loginWasCalled = true
        
        if AppConfig.enableAPI {
            let parameters = "{\"user\" : \"\(user)\"&\"password\" : \"\(password)\"}"
            let postData = parameters.data(using: .utf8)
            let requestURL = "\(baseURL)\(path)"
            guard let url = URL(string: requestURL) else {return}
            var request = URLRequest(url: url)
            request.httpMethod = HTTPMethod.post.rawValue
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpBody = postData
            dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data,
                      let response = response else { return }
                if let error = error {
                    completion(.failure(error))
                    print("DataTask error: \(error.localizedDescription)")
                    return
                }
                print(response)
                do {
                    let data = try decoder.decode(User.self, from: data)
                    DispatchQueue.main.async { completion(.success(data)) }
                } catch let error { completion(.failure(error)) }
            }
            dataTask?.resume()
            
        } else {
            guard let file = Bundle.main.url(forResource: "userJson", withExtension: "json") else { return }
            do {
                let data = try Data(contentsOf: file)
                let user = try decoder.decode(User.self, from: data)
                DispatchQueue.main.async { completion(.success(user)) }
            } catch  {
                print("something happen")
            }
        }
    }
    
    func getCurrencyByUser(user: Int, completion: @escaping (Result<[CurrencyByUser], Error>) -> Void) {
        requestWasCalled = true
        
        if AppConfig.enableAPI {
            let requestURL = "\(baseURL)statements/\(user)"
            guard let url = URL(string: requestURL) else {return}
            var request = URLRequest(url: url)
            request.httpMethod = HTTPMethod.get.rawValue
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data,
                      let response = response else { return }
                if let error = error {
                    print(response)
                    completion(.failure(error))
                    print("DataTask error: \(error.localizedDescription)")
                    return
                }
                do {
                    let userCurrency = try decoder.decode([CurrencyByUser].self, from: data)
                    DispatchQueue.main.async { completion(.success(userCurrency)) }
                } catch let error { completion(.failure(error)) }
            }
            dataTask?.resume()
        } else {
            guard let file = Bundle.main.url(forResource: "currencyJson", withExtension: "json") else { return }
            do {
                let data = try Data(contentsOf: file)
                let userCurrency = try decoder.decode([CurrencyByUser].self, from: data)
                DispatchQueue.main.async { completion(.success(userCurrency)) }
            } catch  {
                print("something happen")
            }
        }
    }
}
