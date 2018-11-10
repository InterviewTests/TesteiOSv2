//
//  LocalStorageManager.swift
//  TesteiOSv2
//
//  Created by Bruno on 09/11/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import Foundation

protocol LocalStorageManagerProtocol {
    func loadLoginInfo() -> (userName: String?, password: String?)
}

class MockLocalStorageManager: LocalStorageManagerProtocol {
    
    func loadLoginInfo() -> (userName: String?, password: String?) {
        return ("name", "password")
    }
}
