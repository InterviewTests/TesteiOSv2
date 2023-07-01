import Foundation

// MARK: - LoginDisplayLogic
protocol LoginDisplayLogic: AnyObject {
    func displayLoginSuccess(userId: String)
    func displayLoginError(message: String)
}

// MARK: - LoginInteractor
protocol LoginBusinessLogic {
    func login(username: String, password: String)
}

// MARK: - LoginPresenter
protocol LoginPresentationLogic {
    func presentLoginSuccess(userId: String)
    func presentLoginError(message: String)
}

// MARK: - LoginRouter
protocol LoginRoutingLogic {
    func routeToNextScene()
}

// MARK: - LoginDataStore
protocol LoginDataStore {
    var dataToPass: String? { get set }
}
