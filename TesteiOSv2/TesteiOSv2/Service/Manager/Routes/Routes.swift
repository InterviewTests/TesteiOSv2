//
//  Routes.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

class Routes: NSObject {
    // MARK: - Authentication
    static var login: URL {
        return URLBaseManager.baseURL.appendingPathComponent("/login")
    }
    
    // MARK: - Statements
    static func getStatements(page: String) -> URL {
        return  URLBaseManager.baseURL.appendingPathComponent("/statements/\(page)")
    }
}
