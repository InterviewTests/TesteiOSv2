@testable import MyBankApp
import UIKit
import Foundation

final class URLSessionDataTaskMock: URLSessionDataTaskProtocol {
    private let completionHandler: () -> Void
    
    init(completionHandler: @escaping () -> Void) {
        self.completionHandler = completionHandler
    }
    
    func resume() {
        completionHandler()
    }
}

final class URLSessionSpy: URLSessionProtocol {
    var mockedData: Data?
    var mockedResponse: URLResponse?
    var mockedError: Error?
    
    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTaskProtocol {
        let data = mockedData
        let response = mockedResponse
        let error = mockedError
        
        return URLSessionDataTaskMock { [weak self] in
            completionHandler(data, response, error)
        }
    }
}
