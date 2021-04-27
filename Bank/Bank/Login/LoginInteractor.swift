import UIKit

protocol LoginBusinessLogic {
    func validFields(request: Login.LoginModels.Request)
}

protocol LoginDataStore {
    var user: User? { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {

    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    var user: User?
    
    // MARK: Do something
    
    fileprivate func doLogin(request: Login.LoginModels.Request) {
        worker = LoginWorker(url: makeApiUrl(path: Endpoint.getEndpoint(.login)()), httpClient: AlamofireAdapter())
        worker?.auth(authentication: request.auth) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let user):
                let response = Login.LoginModels.Response()
                self.user = user
                self.presenter?.presentLogin(response: response)
                
            case .failure(let error):
                self.presenter?.presentError(error: error)
            }
        }
    }
    
    func validFields(request: Login.LoginModels.Request) {

        if let user = request.auth.user, let password = request.auth.password {
            if validUser(user: user) && validPassword(pass: password) {
                doLogin(request: request)
            }
            else {
                presenter?.presentMsgInvalidFields()
            }
        }
    }
    
    func validUser(user: String) -> Bool {
        
        return validEmail(email: user) || validCpf(cpf: user)
    }
    
    func validPassword(password: String) -> Bool {
                
        return validPassword(pass: password)
    }
    
    fileprivate func validEmail(email: String) -> Bool {
        
        return Util.isEmailValid(email: email)
    }
    
    fileprivate func validCpf(cpf: String) -> Bool {
        
        return Util.isCpfValid(cpf: cpf)
    }
    
    fileprivate func validPassword(pass: String) -> Bool {
        
        let passwordRegex = "^(?=.*[A-Z])(?=.*[!@#$&()\\-_=+{}|?*])(?=.*[0-9a-z>.<,:;~`’]).{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: pass)
    }
}
