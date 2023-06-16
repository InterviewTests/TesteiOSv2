//
//  UserFailure.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import Foundation

enum UserFailure: Error, Equatable  {

    // MARK: - Equatable

    static func == (lhs: UserFailure, rhs: UserFailure) -> Bool {
        switch (lhs, rhs) {
        case (.password, .password): return true
        case (.user, .user): return true
        case (.network(let lnet), .network(let rnet)):
            return lnet == rnet
        default:
            return false
        }
    }


    // MARK: - Cases

    case network(ErrorResponse?)
    case password
    case user
    
}
