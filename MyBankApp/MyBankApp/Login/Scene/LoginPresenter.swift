import Foundation

final class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    
    func presentLoginSuccess() {
        viewController?.displayLoginSuccess()
    }
    
    func presentLoginError(message: String) {
        viewController?.displayLoginError(message: message)
    }
}
