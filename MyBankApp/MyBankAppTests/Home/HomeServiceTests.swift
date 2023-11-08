@testable import MyBankApp
import XCTest

final class HomeServiceTests: XCTestCase {
    private var sut: HomeService!
    private var networkServiceSpy: NetworkServiceSpy!
    
    override func setUp() {
        super.setUp()
        networkServiceSpy = NetworkServiceSpy()
        sut = HomeService(networkService: networkServiceSpy)
    }
    
    override func tearDown() {
        sut = nil
        networkServiceSpy = nil
        super.tearDown()
    }
    
    func test_fetchStatements_givenSuccessResponse_whenValidUrlAndValidMethod_shouldSucceedWithValidStatements() {
        // Given
        let expectedStatements = [
            Statement(id: 1, type: "Expense", date: "2023-06-30", detail: "Groceries", value: 50.0),
            Statement(id: 2, type: "Income", date: "2023-06-29", detail: "Salary", value: 2000.0)
        ]
        
        let responseJSON = """
        {
                "statement": [
                {"id": 1, "type": "Expense", "date": "2023-06-30", "detail": "Groceries", "value": 50.0},
                {"id": 2, "type": "Income", "date": "2023-06-29", "detail": "Salary", "value": 2000.0}
            ]
        }
        """
        
        let responseData = responseJSON.data(using: .utf8)!
        networkServiceSpy.mockedResult = .success(responseData)
        
        // When
        var capturedResult: Result<HomeResponse, NetworkError>?
        sut.fetchStatements(for: "user123") { result in
            capturedResult = result
        }
        
        // Then
        XCTAssertEqual(networkServiceSpy.capturedURL?.absoluteString, "https://6092aef785ff5100172136c2.mockapi.io/api/statements")
        XCTAssertEqual(networkServiceSpy.capturedMethod, .get)
        switch capturedResult {
            case .success(let statements):
            XCTAssertEqual(statements.statement, expectedStatements)
            case .failure(let error):
                XCTFail("Expected success, but received failure with error: \(error)")
            case .none:
                XCTFail("Result is nil")
        }
    }
    
    func test_fetchStatements_givenFailureResponse_shouldFailWithExpectedError() {
        // Given
        let expectedError = NetworkError.requestFailed
        networkServiceSpy.mockedResult = .failure(expectedError)
        
        // When
        var capturedResult: Result<HomeResponse, NetworkError>?
        sut.fetchStatements(for: "user123") { result in
            capturedResult = result
        }
        
        // Then
        XCTAssertEqual(networkServiceSpy.capturedURL?.absoluteString, "https://6092aef785ff5100172136c2.mockapi.io/api/statements")
        XCTAssertEqual(networkServiceSpy.capturedMethod, .get)
        switch capturedResult {
            case .success(let statements):
                XCTFail("Expected failure, but received success with statements: \(statements)")
            case .failure(let error):
                XCTAssertEqual(error, expectedError)
            case .none:
                XCTFail("Result is nil")
        }
    }
}
