//
//  BankStoreProtocol.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

protocol BankStoreProtocol {
    func authenticate(user: String, password: String, completion: @escaping(User?, BankError?) -> Void) throws
}
