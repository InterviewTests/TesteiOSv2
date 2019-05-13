//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright (c) 2019 Fabio Morais. All rights reserved.

import UIKit

protocol StatementsPresentationLogic {
    func setupHeader(data: StatementsModel.Header.Response)
    func presentGetStatements(response: StatementsModel.Fetch.Response)
    func presenGetStatementsError(error: String)
}

class StatementsPresenter {
    weak var viewController: StatementsDisplayLogic?
}

// MARK: - Privates Presentation Logic
extension StatementsPresenter: StatementsPresentationLogic {
    
    func setupHeader(data: StatementsModel.Header.Response) {
        let name = data.headerDataResponse?.name ?? ""
        let agency = data.headerDataResponse?.agency ?? ""
        let bankAccount = data.headerDataResponse?.bankAccount ?? ""
        let agencyAndCount = agency + bankAccount
        let balance = data.headerDataResponse?.balance?.currencyFormatted() ?? "R$ 0,00"
        let viewModel = StatementsModel.Header.ViewModel(name: name,
                                                         account: agencyAndCount,
                                                         balance: balance)
        viewController?.setHeaderData(viewModel: viewModel)
    }
    
    func presentGetStatements(response: StatementsModel.Fetch.Response) {
        guard let statementList = response.statements?.statementList else { return }
        let list = statementList.sorted(by: { $0.date?.toDate().compare($1.date?.toDate() ?? Date()) == .orderedDescending })
        
        let viewModel = StatementsModel.Fetch.ViewModel(statementEntries: list)
        
        viewController?.setData(viewModel: viewModel)
    }
    
    func presenGetStatementsError(error: String) {
        viewController?.showAlertError(error: error)
    }
}
