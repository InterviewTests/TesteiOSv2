//
//  StatementModels.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import Foundation

enum StatementView {
    struct ViewModel {
        struct DisplayedStatementUser {
            var name: String {
                return user?.name ?? ""
            }
            var account: String {
                return "\(user?.agency ?? "") / \(user?.bankAccount ?? "")"
            }
            var balance: String {
                return Helpers.formmaterCurrency(value: user?.balance)
            }
            
            private var user: User?
            
            init(user: User?)
            {
                self.user = user
            }
        }
        struct DisplayedStatementItem {
            let title: String
            let desc: String
            let date: String
            let value: String
        }
    }
}
