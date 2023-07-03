import XCTest
@testable import MyBankApp

final class LoginInteractorTests: XCTestCase {
    private var sut: LoginInteractor!
    private var presenterSpy: LoginPresentationLogicSpy!
    private var workerSpy: LoginWorkerProtocolSpy!
    
    override func setUp() {
        super.setUp()
        presenterSpy = LoginPresentationLogicSpy()
        workerSpy = LoginWorkerProtocolSpy()
        sut = LoginInteractor(presenter: presenterSpy, worker: workerSpy)
    }
    
    override func tearDown() {
        presenterSpy = nil
        workerSpy = nil
        sut = nil
        super.tearDown()
    }
    
    func test_login_givenLoginSuccess_shouldCallPresentLoginSuccess() {
        workerSpy.completionToBeReturned = .success(.fixture())
        
        sut.login(request: LoginRequest(username: "", password: ""))
        
        XCTAssertNotNil(sut.user)
        XCTAssertEqual(presenterSpy.calledMethods, [.presentLoginSuccess])
    }
    
    func test_login_givenLoginFailure_shouldCallPresentLoginError() {
        workerSpy.completionToBeReturned = .failure(.requestFailed)
        
        sut.login(request: LoginRequest(username: "", password: ""))
        
        XCTAssertNil(sut.user)
        XCTAssertEqual(presenterSpy.calledMethods, [.presentLoginError(message: "Request failed")])
    }
}
