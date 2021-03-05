//
//  UserStatement.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 05/03/21.
//

import Foundation

struct UserStatementViewModel {
    let title: String
    let description: String
    let date: Date // inverter para padrao brasileiro
    let value: String
        
    init(from data: StatementsData.StatementData) {
        self.title = data.title
        self.description = data.description
        self.date = Self.convertDateUStoBR(data.date)
        self.value = Self.convertValueToBRCurrencyString(data.value) // 30.20 -> R$ 30,20
    }
    
    
    private static func convertDateUStoBR(_ USdate: String) -> Date {
        return DateConverter.convertUSDateStringToBRDate(USdate) ?? Date()                
    }
    
    private static func convertValueToBRCurrencyString(_ value: Double) -> String {
        return CurrencyConverter.convertUSNumberValueToBRStringValue(value)
    }
}
