//
//  MoneyAttributedString.swift
//  UserInterface
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import UIKit

extension NumberFormatter {
    
    static func formatForCurrency(_ value: Decimal) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "pt-BR")
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyDecimalSeparator = ","
        numberFormatter.groupingSeparator = "."
        numberFormatter.currencySymbol = ""
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        
        return numberFormatter.string(from: value as NSNumber)
    }
    
    static func balanceAttString(with balance: Decimal, and style: (symbolColor: UIColor, textColor: UIColor, fontSize: CGFloat)) -> NSMutableAttributedString? {
        guard let formattedBalance = NumberFormatter.formatForCurrency(balance) else { return nil }
        
        let symbolFont = UIFont.systemFont(ofSize: style.fontSize, weight: .regular)
        let valueFont = UIFont.systemFont(ofSize: style.fontSize, weight: .regular)
        let currencySymbolAtt = NSAttributedString(string: "R$ ", attributes: [.font: symbolFont, .foregroundColor: style.symbolColor])
        let valueAtt = NSAttributedString(string: formattedBalance, attributes: [.font: valueFont, .foregroundColor: style.textColor])
        
        let balanceAttributedString = NSMutableAttributedString()
        balanceAttributedString.append(currencySymbolAtt)
        balanceAttributedString.append(valueAtt)
        
        return balanceAttributedString
    }
}

