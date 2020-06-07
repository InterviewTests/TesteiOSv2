//
//  TransactionModel.swift
//  Presenter
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public struct TransactionModel: Equatable, Hashable {
    public let uuid = UUID()
    
    public let title: String
    public let description: String
    public let date: String
    public let value: Double
    
    public init(title: String, description: String, date: String, value: Double) {
        self.title = title
        self.description = description
        self.date = date
        self.value = value
    }
    
    public static func == (lhs: TransactionModel, rhs: TransactionModel) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
