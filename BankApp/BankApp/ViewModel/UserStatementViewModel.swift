//
//  UserStatementViewModel.swift
//  BankApp
//  Adapt the result of GET request (the statemets of each user) for to show properly in view - For example, the date from JSON Statement is US-format and the date in the view is BR-format.
//
//  Created by Adriano Rodrigues Vieira on 05/03/21.
//

import Foundation

struct UserStatementViewModel {
    let title: String
    let description: String
    let date: String
    let value: String
        
    /// Creates a UserStatementViewModel based on data fetched from GET request
    /// - parameter data: a StatementData object
    init(from data: StatementsData.StatementData) {
        self.title = data.title
        self.description = data.description
        self.date = Self.convertDateUStoBR(data.date)
        self.value = Self.convertValueToBRCurrencyString(data.value) // 30.20 -> R$ 30,20
    }
    
    /// Convert a US-pattern date string (yyyy-MM-dd) to BR-pattern date string (dd/MM/yyyy)
    /// - parameter USdate: a string with pattern yyyy-MM-dd
    /// - returns: a string with pattern dd/MM/yyyy
    private static func convertDateUStoBR(_ USdate: String) -> String {
        return DateConverter.convertUSDateStringToBRDateString(USdate)                
    }
    
    /// Convert a double currency value (for example, 3.50) to a Brazil currency format string (for example: R$ 3, 50)
    /// - parameter value: a double value representing a currency number
    /// - returns: a string containing the value formatted in Brazil currency pattern (aka. R$ x,xx)
    private static func convertValueToBRCurrencyString(_ value: Double) -> String {
        return CurrencyConverter.convertUSNumberValueToBRStringValue(value)
    }
}
