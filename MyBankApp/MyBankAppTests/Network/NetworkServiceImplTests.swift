import XCTest
@testable import MyBankApp

final class NetworkServiceImplTests: XCTestCase {
    
    var sut: NetworkServiceImpl!
    var urlSessionMock: URLSessionSpy!
    
    override func setUp() {
        super.setUp()
        urlSessionMock = URLSessionSpy()
        sut = NetworkServiceImpl(urlSession: urlSessionMock)
    }
    
    override func tearDown() {
        sut = nil
        urlSessionMock = nil
        super.tearDown()
    }
    
    func test_request_givenSuccessfulResponseWithValidData_shouldReturnSuccess() {
        // Given
        let expectedData = try? JSONEncoder().encode(LoginResponse.fixture())
        let expectedResponse = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        urlSessionMock.mockedData = expectedData
        urlSessionMock.mockedResponse = expectedResponse
        
        // When
        sut.request(url: URL(string: "https://example.com")!, method: .get, bodyParameters: nil) { (result: Result<LoginResponse, NetworkError>) in
            // Then
            switch result {
            case .success(let data):
                XCTAssertEqual(data, LoginResponse.fixture())
            case .failure(_):
                XCTFail("Expected successful response")
            }
        }
    }
    
    func test_request_givenNetworkError_shouldReturnFailureWithRequestFailed() {
        // Given
        let expectedError = NSError(domain: "TestErrorDomain", code: 123, userInfo: nil)
        urlSessionMock.mockedError = expectedError
        
        // When
        sut.request(url: URL(string: "https://example.com")!, method: .get, bodyParameters: nil) { (result: Result<Data, NetworkError>) in
            // Then
            switch result {
            case .success(_):
                XCTFail("Expected network error")
            case .failure(let error):
                XCTAssertEqual(error, NetworkError.requestFailed)
            }
        }
    }
    
    func test_request_givenInvalidStatusCode_shouldReturnFailureWithInvalidResponse() {
        // Given
        let expectedResponse = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 404, httpVersion: nil, headerFields: nil)
        urlSessionMock.mockedResponse = expectedResponse
        
        // When
        sut.request(url: URL(string: "https://example.com")!, method: .get, bodyParameters: nil) { (result: Result<Data, NetworkError>) in
            // Then
            switch result {
            case .success(_):
                XCTFail("Expected invalid response error")
            case .failure(let error):
                XCTAssertEqual(error, NetworkError.invalidResponse)
            }
        }
    }
    
    func test_request_givenResponseSuccessButMissingResponseData_shouldReturnFailureWithDecodingFailed() {
        // Given
        let expectedResponse = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        urlSessionMock.mockedResponse = expectedResponse
        
        // When
        sut.request(url: URL(string: "https://example.com")!, method: .get, bodyParameters: nil) { (result: Result<Data, NetworkError>) in
            // Then
            switch result {
            case .success(_):
                XCTFail("Expected missing response data error")
            case .failure(let error):
                XCTAssertEqual(error, NetworkError.decodingFailed)
            }
        }
    }
    
    func test_request_givenSuccessButWithEmptyResponseData_shouldReturnFailureWithDecodingFailed() {
        // Given
        let expectedResponse = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        let emptyData = Data()
        urlSessionMock.mockedData = emptyData
        urlSessionMock.mockedResponse = expectedResponse
        
        // When
        sut.request(url: URL(string: "https://example.com")!, method: .get, bodyParameters: nil) { (result: Result<Data, NetworkError>) in
            // Then
            switch result {
            case .success(_):
                XCTFail("Expected empty response data error")
            case .failure(let error):
                XCTAssertEqual(error, NetworkError.decodingFailed)
            }
        }
    }
}
