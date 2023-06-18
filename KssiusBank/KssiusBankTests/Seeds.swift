//
//  Seeds.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 15/06/23.
//

import Foundation

struct Seeds {
    enum Json: String {
        case account = """
        {
        "createdAt": "2023-06-15T23:36:43.182Z",
        "name": "Diana Leuschke",
        "email": "Marquis_Gibson@hotmail.com",
        "cpf": "468.655.400-42",
        "accountNumber": "74393734",
        "agency": "827810101",
        "balance": 472.29,
        "id": "3"
        }
        """
    }

    static let email = "Marquis_Gibson@hotmail.com"
    static let password = "T@to123"
    static let cpf = "468.655.400-42"

    static let user = UserAccountModel(userId: "3",
                                       email: "Marquis_Gibson@hotmail.com",
                                       cpf: "468.655.400-42",
                                       name: "Diana Leuschke",
                                       accountNumber: "74393734",
                                       agency: "827810101",
                                       balance: 472.29)

    enum Statements {
        static let json = """
        [
            {
            "type": "payment",
            "description": "Conta de Luz",
            "date": "2020-01-02",
            "value": 1550.50
            },
            {
            "type": "invoice",
            "description": "Conta de Luz",
            "date": "2020-02-05",
            "value": 300
            },
            {
            "type": "deposit",
            "description": "Conta de Luz",
            "date": "2020-04-03",
            "value": 200.30
            }
        
        ]
        """

        static let statements = [
            StatementsModel(type: .payment, description: "Conta de Luz", date: .init(year: 2020, month: 01, day: 2), value: 200.00),
            StatementsModel(type: .invoice, description: "Conta de Luz", date: .init(year: 2020, month: 02, day: 5), value: 300.00),
            StatementsModel(type: .deposit, description: "Conta de Luz", date: .init(year: 2020, month: 04, day: 3), value: 200.00)
        ]
    }
}

extension Date {

    init( year: Int, month: Int, day: Int) {
        var dateComponents = DateComponents()
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.year = year
        dateComponents.timeZone = .current
        dateComponents.calendar = .current
        self = Calendar.current.date(from: dateComponents) ?? Date()
    }
}
