//
//  AppConfig.swift
//  Bank App
//
//  Created by Christian Castro on 30/04/21.
//

import Foundation

enum AppConfig {
    static var baseAppURL: String { "https://bank-app-test.herokuapp.com/api/" }
    
    static var enableAPI = false
}

enum HTTPMethod: String {
    case options = "OPTIONS"
    case get = "GET"
    case head = "HEAD"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
