import Foundation

final class LoginInteractor: LoginBusinessLogic {
    var presenter: LoginPresentationLogic?
    let loginService: LoginServiceProtocol
    
    init(presenter: LoginPresentationLogic? = nil, loginService: LoginServiceProtocol = LoginService()) {
        self.presenter = presenter
        self.loginService = loginService
    }
    
    func login(username: String, password: String) {
        presenter?.presentLoginSuccess(userId: "")
//        loginService.login(user: username, password: password) { [presenter] result in
//            switch result {
//            case .success(let response):
//                print("Logged in with ID:", response.id)
//                presenter?.presentLoginSuccess(userId: response.id)
//            case .failure(let error):
//                print("Login error:", error.localizedDescription)
//                presenter?.presentLoginError(message: "Invalid credentials")
//            }
//        }
    }
}
