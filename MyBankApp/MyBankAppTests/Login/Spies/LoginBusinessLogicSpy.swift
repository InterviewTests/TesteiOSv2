import XCTest
@testable import MyBankApp

final class LoginBusinessLogicSpy: LoginBusinessLogic {
    enum Methods: Equatable {
        case login(LoginRequest)
    }
    
    private(set) var calledMethods: [Methods] = []
    
    func login(request: LoginRequest) {
        calledMethods.append(.login(request))
    }
}
