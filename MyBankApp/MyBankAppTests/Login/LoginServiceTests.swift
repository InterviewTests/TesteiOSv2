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
    
    func test_givenLoginSuccess_shouldReturnValidLoginResponse() {
        // Given
        let expectedID = "user123"
        let expectedEmail = "fulano@teste.com"
        let expectedCpf = "123.456.789-10"
        let expectedName = "Fulano de Tail"
        let expectedAccountNumber = "123456"
        let expectedAgency = "123"
        let expectedBalance = "R$ 1.000,00"
        let responseJSON = """
            {
                "userId": "\(expectedID)",
                "email": "\(expectedEmail)",
                "cpf": "\(expectedCpf)",
                "name": "\(expectedName)",
                "accountNumber": "\(expectedAccountNumber)",
                "agency": "\(expectedAgency)",
                "balance": "\(expectedBalance)"
            }
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
            XCTAssertEqual(response.userId, expectedID)
            XCTAssertEqual(response.email, expectedEmail)
            XCTAssertEqual(response.cpf, expectedCpf)
            XCTAssertEqual(response.name, expectedName)
            XCTAssertEqual(response.accountNumber, expectedAccountNumber)
            XCTAssertEqual(response.agency, expectedAgency)
            XCTAssertEqual(response.balance, expectedBalance)
        case .failure(_):
            XCTFail()
        case .none:
            XCTFail()
        }
    }
    
    func test_givenLoginFailure_shouldFailWithExpectedError() {
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
