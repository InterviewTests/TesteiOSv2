import XCTest
@testable import MyBankApp

final class LoginBusinessLogicSpy: LoginBusinessLogic {
    enum Methods: Equatable {
        case login(username: String, password: String)
    }
    
    private(set) var calledMethods: [Methods] = []
    
    func login(username: String, password: String) {
        calledMethods.append(.login(username: username, password: password))
    }
}
