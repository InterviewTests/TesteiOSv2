import Foundation

final class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    var worker: LoginWorkerProtocol
    
    var user: LoginResponse?
    
    init(
        presenter: LoginPresentationLogic? = nil,
        worker: LoginWorkerProtocol = LoginWorker()
    ) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func login(request: LoginRequest) {
        /// Uncomment this line, and comment the loginService implementation above if Login API is not working, so the app on the simulator can work properly
        presenter?.presentLoginSuccess()
//        worker.login(request: request) { [weak self] result in
//            switch result {
//            case .success(let response):
//                self?.user = response
//                self?.presenter?.presentLoginSuccess()
//            case .failure(let error):
//                self?.presenter?.presentLoginError(message: error.localizedDescription)
//            }
//        }
    }
}
