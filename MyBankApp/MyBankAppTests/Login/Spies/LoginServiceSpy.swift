import XCTest
@testable import MyBankApp

final class LoginServiceSpy: LoginServiceProtocol {
    enum Method: Equatable {
        case login(user: String, password: String)
    }
    private(set) var calledMethods: [Method] = []
    
    var completionToBeReturned: Result<MyBankApp.LoginResponse, MyBankApp.NetworkError> = .success(.fixture())
    func login(user: String, password: String, completion: @escaping (Result<MyBankApp.LoginResponse, MyBankApp.NetworkError>) -> Void) {
        calledMethods.append(.login(user: user, password: password))
        completion(completionToBeReturned)
    }
}
