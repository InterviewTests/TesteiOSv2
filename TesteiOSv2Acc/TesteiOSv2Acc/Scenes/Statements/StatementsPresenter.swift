//
//  StatementsPresenter.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 21/05/19.
//  Copyright (c) 2019 Marlon Santos Heitor. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol StatementsPresentationLogic
{
    func presentStatements(response: Statements.LoadStatements.Response)
    func presentCustomerData(response: Statements.LoadCustomerData.Response)
    func presentLoggedOut(response: Statements.Logout.Response)
}

class StatementsPresenter: StatementsPresentationLogic
{
    
    weak var viewController: StatementsDisplayLogic?
    
    // MARK: - ViewController methods
    
    func presentCustomerData(response: Statements.LoadCustomerData.Response) {
        let viewModel = Statements.LoadCustomerData.ViewModel()
        viewController?.displayCustomerData(viewModel: viewModel)
    }
    
    func presentStatements(response: Statements.LoadStatements.Response)
    {
        let viewModel = Statements.LoadStatements.ViewModel(statements: response.statements, serviceError: response.serviceError)
        viewController?.displayStatements(viewModel: viewModel)
    }
    
    func presentLoggedOut(response: Statements.Logout.Response) {
        let viewModel = Statements.Logout.ViewModel()
        viewController?.displayLoggedOut(viewModel: viewModel)
    }
}
