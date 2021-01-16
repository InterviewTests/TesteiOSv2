//
//  StatementsPresenter.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

class StatementsPresenter {
    
    weak var view: StatementsPresenterDelegate?
    var router: StatementsRouter?
    
    
    func formatAsCurrency(_ value: Float) -> String {
        let valueFormatString = (value < 0)  ? "- R$ %.2f"  : "R$ %.2f"
        return String(format: valueFormatString, locale: Locale(identifier: "pt_br"), abs(value))
    }
    
    func convertDate(_ dateString: String, fromFormat originFormat: String, toFormat destinyFormat: String) -> String? {
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = originFormat
            formatter.timeZone = NSTimeZone(forSecondsFromGMT: TimeZone.current.secondsFromGMT()) as TimeZone
            return formatter
        }()
        
        
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        
        dateFormatter.dateFormat = destinyFormat
        return dateFormatter.string(from: date)
    }
    
}

// MARK: - Access from Interactor

extension StatementsPresenter: StatementsPresenterProtocol {
    func presentUserInfo() {
        // TODO: Converter informações no formato de apresentação
        view?.showUserInfo()
    }
    
    func startRequest() {
        view?.startRequesting()
    }
    
    func finishRequest() {
        view?.finishRequesting()
    }
    
    func presentFetchedStatements(response: StatementsModels.Response) {
        // TODO: Ordenar por data
        // TODO: Fluxo alternativo: quantidade == 0
        
        let viewModels = response.statementsList.map({ statement -> StatementsModels.ViewModel.StatementViewModel in
            
            let date = convertDate(statement.date, fromFormat: "yyyy-MM-dd", toFormat: "dd/MM/yyyy") ?? statement.date
            let value = formatAsCurrency(statement.value)
            
            return StatementsModels.ViewModel.StatementViewModel(title: statement.title,
                                                                 description: statement.desc,
                                                                 date: date,
                                                                 value: value)
        })
        let viewModel = StatementsModels.ViewModel(statements: viewModels)
        
        view?.displayStatements(viewModel: viewModel)
    }
    
    func didFailToFetchStatement(_ errorMessage: String) {
        view?.showFailToFetchStatements(errorMessage)
    }
}
