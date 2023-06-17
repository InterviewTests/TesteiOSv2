//
//  StatementsModel.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 17/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import Foundation

struct StatementsModel: Codable, Equatable {
    let type: String
    let description: String
    let date: Date
    let value: Double
}
