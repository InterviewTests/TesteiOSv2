import Foundation

final class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    
    init(viewController: LoginDisplayLogic? = nil) {
        self.viewController = viewController
    }
    
    func presentLoginSuccess() {
        viewController?.displayLoginSuccess()
    }
    
    func presentLoginError(message: String) {
        viewController?.displayLoginError(message: message)
    }
}
