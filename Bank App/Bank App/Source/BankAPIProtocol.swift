//
//  BankAPIProtocol.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 29/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

protocol BankAPIProtocol {
    
    func loginUser(login: UserLogin, completionHandler: @escaping (UserResponse?) -> Void)
    func statementList(by userId: Int, completionHandler: @escaping (StatementResponse?) -> Void) 
}
