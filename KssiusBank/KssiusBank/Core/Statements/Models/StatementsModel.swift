//
//  StatementsModel.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 17/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import Foundation

struct StatementsModel: Codable, Equatable {
    enum StatementsType: String, Codable, Equatable {
        case invoice, payment, withdrawal, deposit

        var rawValue: String {
            switch self {
            case .payment:
                return "Pagamento"
            case .deposit:
                return "Depósito"
            case .invoice:
                return "Fatura"
            case .withdrawal:
                return "Retirada"
            }
        }
    }
    let type: StatementsType
    let description: String
    let date: Date
    let value: String
}
