//
//  BankApiProtocol.swift
//  Bank App
//
//  Created by Christian Castro on 30/04/21.
//

import Foundation

protocol BankApiProtocol {
    var baseURL: URL { get }
    var path: String { get }
    
    func login(path:String, user: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func getCurrencyByUser(user: Int, completion: @escaping (Result<[CurrencyByUser], Error>) -> Void)
}

extension BankApiProtocol {
    var baseURL: URL { return URL(string: AppConfig.baseAppURL) ?? baseURL}
}
