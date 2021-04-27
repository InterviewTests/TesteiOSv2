import UIKit

protocol CurrencyPresentationLogic {
    func presentStatements(response: Currency.StatementModel.Response)
    func presentError(error: MessageError)
}

class CurrencyPresenter: CurrencyPresentationLogic {
    weak var viewController: CurrencyDisplayLogic?
    
    // MARK: Do something
    
    func presentStatements(response: Currency.StatementModel.Response) {
        let viewModel = Currency.StatementModel.ViewModel(statements: response.statements)
        viewController?.displayStatements(viewModel: viewModel)
    }
    
    func presentError(error: MessageError) {
        
    }
}
