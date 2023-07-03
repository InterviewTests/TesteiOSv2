import XCTest
@testable import MyBankApp

final class LoginInteractorTests: XCTestCase {
    private var sut: LoginInteractor!
    private var presenterSpy: LoginPresentationLogicSpy!
    private var loginServiceSpy: LoginServiceSpy!
    
    override func setUp() {
        super.setUp()
        presenterSpy = LoginPresentationLogicSpy()
        loginServiceSpy = LoginServiceSpy()
        sut = LoginInteractor(presenter: presenterSpy, loginService: loginServiceSpy)
    }
    
    override func tearDown() {
        presenterSpy = nil
        loginServiceSpy = nil
        sut = nil
        super.tearDown()
    }
    
    func test_login_givenLoginSuccess_shouldCallPresentLoginSuccess() {
        loginServiceSpy.completionToBeReturned = .success(.fixture())
        
        sut.login(username: "teste@teste.com", password: "A@3")
        
        XCTAssertNotNil(sut.user)
        XCTAssertEqual(presenterSpy.calledMethods, [.presentLoginSuccess])
    }
    
    func test_login_givenLoginFailure_shouldCallPresentLoginError() {
        loginServiceSpy.completionToBeReturned = .failure(.requestFailed)
        
        sut.login(username: "teste@teste.com", password: "A@3")
        
        XCTAssertNil(sut.user)
        XCTAssertEqual(presenterSpy.calledMethods, [.presentLoginError(message: "Invalid credentials")])
    }
}
