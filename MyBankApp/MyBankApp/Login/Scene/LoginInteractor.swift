import Foundation

final class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    let loginService: LoginServiceProtocol
    
    var user: LoginResponse?
    
    init(
        presenter: LoginPresentationLogic? = nil,
        loginService: LoginServiceProtocol = LoginService()
    ) {
        self.presenter = presenter
        self.loginService = loginService
    }
    
    func login(username: String, password: String) {
        /// Uncomment this line, and comment the loginService implementation above if Login API is not working, so the app on the simulator can work properly
//        presenter?.presentLoginSuccess()
        
        loginService.login(user: username, password: password) { [weak self, presenter] result in
            switch result {
            case .success(let response):
                guard let self = self else { return }
                print("Logged in with ID:", response.userId)
                self.user = response
                presenter?.presentLoginSuccess()
            case .failure(let error):
                print("Login error:", error.localizedDescription)
                presenter?.presentLoginError(message: "Invalid credentials")
            }
        }
    }
}
