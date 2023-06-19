//
//  StatementsFailure.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import Foundation

enum StatementsFailure: Error, Equatable  {

    // MARK: - Equatable

    static func == (lhs: StatementsFailure, rhs: StatementsFailure) -> Bool {
        switch (lhs, rhs) {
        case (.network(let lnet), .network(let rnet)):
            return lnet == rnet
        default:
            return false
        }
    }

    // MARK: - Cases

    case network(ErrorResponse?)
    
}
