import XCTest
@testable import MyBankApp

final class LoginRouterSpy: LoginRouter {
    enum Method: Equatable {
        case routeToHome
    }
    
    private(set) var calledMethods: [Method] = []
    
    override func routeToHome() {
        calledMethods.append(.routeToHome)
    }
}
