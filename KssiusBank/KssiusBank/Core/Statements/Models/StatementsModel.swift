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
    }
    let type: StatementsType
    let description: String
    let date: Date
    let value: String
}
