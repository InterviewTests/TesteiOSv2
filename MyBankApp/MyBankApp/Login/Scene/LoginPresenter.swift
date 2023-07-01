import Foundation

final class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    
    func presentLoginSuccess(userId: String) {
        viewController?.displayLoginSuccess(userId: userId)
    }
    
    func presentLoginError(message: String) {
        viewController?.displayLoginError(message: message)
    }
}
