import XCTest
@testable import MyBankApp

final class LoginPresentationLogicSpy: LoginPresentationLogic {
    enum Method: Equatable {
        case presentLoginSuccess
        case presentLoginError(message: String)
    }
    private(set) var calledMethods: [Method] = []
    
    func presentLoginSuccess() {
        calledMethods.append(.presentLoginSuccess)
    }
    
    func presentLoginError(message: String) {
        calledMethods.append(.presentLoginError(message: message))
    }
}
