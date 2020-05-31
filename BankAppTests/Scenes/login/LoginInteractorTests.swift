@testable import BankApp
import XCTest

class LoginInteractorTests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: LoginInteractor!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupLoginInteractor()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupLoginInteractor()
    {
        sut = LoginInteractor()
    }
    
    // MARK: - Test doubles
    
    class LoginPresentationLogicSpy: LoginPresentationLogic
    {
        // MARK: Method call expectations
        
        var presentCreateLoginCalled = false
        
        // MARK: Spied methods
        func presentCreateLogin(response: Login.CreateLogin.Response) {
            presentCreateLoginCalled = true
        }
    }
    
    class LoginWorkerSpy: UserWorker
    {
        // MARK: Method call expectations
        
        var loginUserCalled = false
        
        // MARK: Spied methods
        
        override init(loginStore: LoginStoreProtocol) {
            super.init(loginStore: loginStore)
            loginUserCalled = true
        }
        
    }
    
    // MARK: - Tests
    
    func testFetchLoginShouldAskLoginWorkerToFetchLoginAndPresenterToFormatResult()
    {
        // Given
        let loginPresentationLogicSpy = LoginPresentationLogicSpy()
        sut.presenter = loginPresentationLogicSpy
        let loginWorkerSpy = LoginWorkerSpy(loginStore: LoginMemStore())
        sut.userWorker = loginWorkerSpy
        
        // When
        let request = Login.CreateLogin.Request(loginFromFields: Seeds.UserInfo.loginFromFields)
        sut.createLogin(request: request)
        
        // Then
        XCTAssert(loginWorkerSpy.loginUserCalled, "FetchLogin() should ask UserWorker to login")
        XCTAssert(loginPresentationLogicSpy.presentCreateLoginCalled, "FetchLogin() should ask presenter to format login result")
    }
}
