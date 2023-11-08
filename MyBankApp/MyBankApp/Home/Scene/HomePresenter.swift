import Foundation

final class HomePresenter: HomePresentationLogic {
    weak var viewController: HomeDisplayLogic?
    
    func presentStatementsSuccess(_ statements: [Statement]) {
        viewController?.displayStatements(statements)
    }
    
    func presentStatementsError(message: String) {
        viewController?.displayStatementsError(message: message)
    }
}
