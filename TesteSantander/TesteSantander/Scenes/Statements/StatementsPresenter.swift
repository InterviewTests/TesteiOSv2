//
//  StatementsPresenter.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//
//

import UIKit

protocol StatementsPresentationLogic {
    func presentFetchStatements(response: StatementsModel.Fetch.Response)
    func presentFetchError(error: String)
    func setupHeader(data: StatementsModel.Header.Response)
}

class StatementsPresenter: StatementsPresentationLogic {
    
    weak var viewController: StatementsDisplayLogic?
  
    func presentFetchStatements(response: StatementsModel.Fetch.Response) {
        guard let statementList = response.statements?.statementList else { return }
        let list = statementList.sorted(by: { $0.date?.toDate().compare($1.date?.toDate() ?? Date()) == .orderedDescending })
        
        let viewModel = StatementsModel.Fetch.ViewModel(statementEntries: list)

        viewController?.displayData(viewModel: viewModel)
    }
    
    func presentFetchError(error: String) {
        
    }
    
    func setupHeader(data: StatementsModel.Header.Response) {
        let name = data.headerData?.name ?? ""
        let account = "\(data.headerData?.bankAccount ?? "")/\(data.headerData?.agency ?? "")"
        let balance = String(format: "R$ %.02f", data.headerData?.balance ?? 0.0)
        let viewModel = StatementsModel.Header.ViewModel(name: name,
                                                         account: account,
                                                         balance: balance)
        viewController?.displayHeaderData(viewModel: viewModel)
    }
    
}
