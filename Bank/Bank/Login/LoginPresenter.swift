import UIKit

protocol LoginPresentationLogic {
    func presentLogin(response: Login.LoginModels.Response)
    func presentError(error: MessageError)
    func presentMsgInvalidFields()
}

class LoginPresenter: LoginPresentationLogic {
    
    func presentError(error: MessageError) {
        viewController?.alertInvalidFields(message: NSLocalizedString("login_msg_invalid_login", comment: ""))
    }
    
    func presentLogin(response: Login.LoginModels.Response) {
        let viewModel = Login.LoginModels.ViewModel()
        viewController?.routeToStatement(viewModel: viewModel)
    }
    
    func presentMsgInvalidFields() {
        viewController?.alertInvalidFields(message: NSLocalizedString("login_msg_invalid_field", comment: ""))
    }
    
    weak var viewController: LoginDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: Login.LoginModels.Response) {
        let viewModel = Login.LoginModels.ViewModel()
        viewController?.routeToStatement(viewModel: viewModel)
    }
}
