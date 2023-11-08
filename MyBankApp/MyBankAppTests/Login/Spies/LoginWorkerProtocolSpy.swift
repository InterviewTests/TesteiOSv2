@testable import MyBankApp

final class LoginWorkerProtocolSpy: LoginWorkerProtocol {
    enum Method: Equatable {
        case login(LoginRequest)
    }
    
    private(set) var calledMethods: [Method] = []
    
    var completionToBeReturned: Result<MyBankApp.LoginResponse, MyBankApp.NetworkError> = .success(.fixture())
    func login(request: MyBankApp.LoginRequest, completion: @escaping (Result<MyBankApp.LoginResponse, MyBankApp.NetworkError>) -> Void) {
        calledMethods.append(.login(request))
        completion(completionToBeReturned)
    }
}
