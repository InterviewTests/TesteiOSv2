import Foundation

// MARK: - LoginDisplayLogic
protocol LoginDisplayLogic: AnyObject {
    func displayLoginSuccess()
    func displayLoginError(message: String)
}

// MARK: - LoginInteractor
protocol LoginBusinessLogic {
    func login(username: String, password: String)
}

// MARK: - LoginPresenter
protocol LoginPresentationLogic {
    func presentLoginSuccess()
    func presentLoginError(message: String)
}

// MARK: - LoginRouter
protocol LoginRoutingLogic {
    func routeToHome()
}

// MARK: - LoginDataStore
protocol LoginDataStore {
    var user: LoginResponse? { get set }
}

// MARK: - LoginDataPassing
protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}
