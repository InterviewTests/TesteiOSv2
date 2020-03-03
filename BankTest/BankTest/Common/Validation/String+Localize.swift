//
//  String+Localize.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 02/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import Foundation

enum Localizable: String {
    case Email = "INVALID_EMAIL"
    case CPF = "INVALID_CPF"
    case Password = "INVALID_PASSWORD"
    case Recent = "RECENT"

    func localize() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
