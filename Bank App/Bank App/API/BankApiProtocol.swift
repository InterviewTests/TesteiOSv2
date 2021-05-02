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
}

extension BankApiProtocol {
    var baseURL: URL { return URL(string: AppConfig.baseAppURL)!}
    
}
