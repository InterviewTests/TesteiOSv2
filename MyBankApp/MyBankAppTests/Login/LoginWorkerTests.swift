@testable import MyBankApp
import XCTest

final class LoginWorkerTests: XCTestCase {
    private var sut: LoginWorker!
    private var loginServiceSpy: LoginServiceSpy!

    override func setUp() {
        super.setUp()
        loginServiceSpy = LoginServiceSpy()
        sut = LoginWorker(loginService: loginServiceSpy)
    }

    override func tearDown() {
        sut = nil
        loginServiceSpy = nil
        super.tearDown()
    }

    func testLoginWithValidCredentials() {
        // Given
        let request = LoginRequest(username: "", password: "")
        let expectedResponse = LoginResponse.fixture()

        loginServiceSpy.completionToBeReturned = .success(expectedResponse)

        // When
        let expectation = XCTestExpectation(description: "Login request")
        sut.login(request: request) { result in
            // Then
            switch result {
            case .success(let response):
                XCTAssertEqual(response, expectedResponse)
            case .failure(let error):
                XCTFail("Login request failed with error: \(error)")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testLoginWithInvalidCredentials() {
        // Given
        let request = LoginRequest(username: "", password: "")

        loginServiceSpy.completionToBeReturned = .failure(.invalidResponse)

        // When
        let expectation = XCTestExpectation(description: "Login request")
        sut.login(request: request) { result in
            // Then
            switch result {
            case .success(_):
                XCTFail("Login request should fail with invalid credentials")
            case .failure(let error):
                XCTAssertEqual(error, .invalidResponse)
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
