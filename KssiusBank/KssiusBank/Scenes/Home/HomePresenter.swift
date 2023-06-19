//
//  HomePresenter.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 17/06/23.
//  Copyright (c) 2023 Cassio Sousa. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomePresentationLogic{
    func presentStatements(response: Home.GetStatements.Response)
    func presentAccount(response: Home.GetAccount.Response)
}

class HomePresenter: HomePresentationLogic{

    weak var viewController: HomeDisplayLogic?

    // MARK: Present Account

    func presentAccount(response: Home.GetAccount.Response) {
        let viewModel = Home.GetAccount.ViewModel(
            name: response.userAccount.name,
            agency: response.userAccount.agency,
            accountNumber: response.userAccount.accountNumber,
            balance: response.userAccount.balance
        )
        viewController?.displayAccount(viewModel: viewModel)
    }

    // MARK: Present Statements

    func presentStatements(response: Home.GetStatements.Response) {
        let statements = mapToStatements(response.statements)
        viewController?.displayStatements(viewModel: .init(statements: statements, success: response.success))
    }

    private func mapToStatements(_ model: [StatementsModel]) -> [Home.GetStatements.StatementViewModel] {
        return model.map{.init(type: statements(type: $0.type),
                               description: $0.description,
                               date: $0.date.formatToString,
                               value: $0.value.toCurrency)
        }
    }
    
    private func statements(type: StatementsModel.StatementsType) -> String {
        switch type {
        case .payment:
            return L10n.Statement.Option.payment
        case .deposit:
            return L10n.Statement.Option.deposit
        case .invoice:
            return L10n.Statement.Option.invoice
        case .withdrawal:
            return L10n.Statement.Option.withdrawal
        }
    }
}
