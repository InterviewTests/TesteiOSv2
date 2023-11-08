import XCTest
@testable import MyBankApp

final class LoginPresenterTests: XCTestCase {
    private var sut: LoginPresenter!
    private var viewControllerSpy: LoginDisplayLogicSpy!
    
    override func setUp() {
        super.setUp()
        viewControllerSpy = LoginDisplayLogicSpy()
        sut = LoginPresenter(viewController: viewControllerSpy)
    }
    
    override func tearDown() {
        viewControllerSpy = nil
        sut = nil
        super.tearDown()
    }
    
    func test_presentLoginSuccess_shouldCallViewControllerpresentLoginSuccess() {
        sut.presentLoginSuccess()
        
        XCTAssertEqual(viewControllerSpy.calledMethods, [.displayLoginSuccess])
    }
    
    func test_presentLoginError_shouldCallViewControllerpresentLoginErrorWithMessage() {
        sut.presentLoginError(message: "message")
        
        XCTAssertEqual(viewControllerSpy.calledMethods, [.displayLoginError(message: "message")])
    }
}
