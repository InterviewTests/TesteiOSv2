import Foundation

// MARK: - HomeDisplayLogic
protocol HomeDisplayLogic: AnyObject {
    func displayStatements(_ statements: [Statement])
    func displayStatementsError(message: String)
}

// MARK: - HomeInteractor
protocol HomeBusinessLogic {
    func fetchUserStatements()
}

// MARK: - HomePresenter
protocol HomePresentationLogic {
    func presentStatementsSuccess(_ statements: [Statement])
    func presentStatementsError(message: String)
}

// MARK: - HomeRouter
protocol HomeRoutingLogic {
    func logout()
}

// MARK: - HomeDataStore
protocol HomeDataStore {
    var user: LoginResponse? { get set }
}

// MARK: - LoginDataPassing
protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}
