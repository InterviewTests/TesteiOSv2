import XCTest
@testable import MyBankApp

final class LoginDisplayLogicSpy: LoginDisplayLogic {
    enum Method: Equatable {
        case displayLoginSuccess
        case displayLoginError(message: String)
    }
    
    private(set) var calledMethods: [Method] = []
    
    func displayLoginSuccess() {
        calledMethods.append(.displayLoginSuccess)
    }
    
    func displayLoginError(message: String) {
        calledMethods.append(.displayLoginError(message: message))
    }
}
