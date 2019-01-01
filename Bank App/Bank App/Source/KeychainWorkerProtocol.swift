//
//  KeychainWorkerProtocol.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 01/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import Foundation

protocol KeychainWorkerProtocol {
    
    var loginKey: String { get }
    var passwordKey: String { get }
    
    func getUserLogin() -> UserLogin
    func saveUserLogin(login: UserLogin)
    func deleteUser()
}
