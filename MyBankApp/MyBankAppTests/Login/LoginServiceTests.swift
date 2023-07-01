@testable import MyBankApp
import XCTest

final class LoginServiceTests: XCTestCase {
    private var sut: LoginService!
    private var networkServiceSpy: NetworkServiceSpy!
    
    override func setUp() {
        super.setUp()
        networkServiceSpy = NetworkServiceSpy()
        sut = LoginService(networkService: networkServiceSpy)
    }
    
    override func tearDown() {
        sut = nil
        networkServiceSpy = nil
        super.tearDown()
    }
    
    func testLoginSuccess() {
        // Given
        let expectedID = "user123"
        let responseJSON = """
            {"id": "\(expectedID)"}
        """
        let responseData = responseJSON.data(using: .utf8)!
        networkServiceSpy.mockedResult = .success(responseData)
        
        // When
        var capturedResult: Result<LoginResponse, NetworkError>?
        sut.login(user: "testuser", password: "testpassword") { result in
            capturedResult = result
        }
        
        // Then
        XCTAssertEqual(networkServiceSpy.capturedURL?.absoluteString, "https://6092aef785ff5100172136c2.mockapi.io/api/login")
        XCTAssertEqual(networkServiceSpy.capturedMethod, .post)
        switch capturedResult {
        case let .success(response):
            XCTAssertEqual(response.id, expectedID)
        case .failure(_):
            XCTFail()
        case .none:
            XCTFail()
        }
    }
    
    func testLoginFailure() {
        // Given
        let expectedError = NetworkError.requestFailed
        networkServiceSpy.mockedResult = .failure(expectedError)
        
        // When
        var capturedResult: Result<LoginResponse, NetworkError>?
        sut.login(user: "testuser", password: "testpassword") { result in
            capturedResult = result
        }
        
        // Then
        XCTAssertEqual(networkServiceSpy.capturedURL?.absoluteString, "https://6092aef785ff5100172136c2.mockapi.io/api/login")
        XCTAssertEqual(networkServiceSpy.capturedMethod, .post)
        switch capturedResult {
        case .success(_):
            XCTFail()
        case let .failure(error):
            XCTAssertEqual(error, expectedError)
        case .none:
            XCTFail()
        }
    }
}
