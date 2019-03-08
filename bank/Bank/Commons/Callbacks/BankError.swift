//
//  BankError.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

enum BankError: Error {
    case badRequest(String)
    case urlInvalid(String)
    case authenticationError(String)
}
