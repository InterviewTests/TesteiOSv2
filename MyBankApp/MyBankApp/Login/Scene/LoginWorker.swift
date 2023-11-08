import Foundation

protocol LoginWorkerProtocol {
    func login(request: LoginRequest, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void)
}

final class LoginWorker: LoginWorkerProtocol {
    
    private var loginService: LoginServiceProtocol
    
    init(loginService: LoginServiceProtocol = LoginService()) {
        self.loginService = loginService
    }
    
    func login(request: LoginRequest, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void) {
        loginService.login(user: request.username, password: request.password, completion: completion)
    }
}
