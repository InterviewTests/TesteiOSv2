import XCTest
import Bank
import Foundation

class LoginIntegrationTests: XCTestCase {

    func test_fazer_login() {
        
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "https://bank-app-test.herokuapp.com/api/login")!
        let sut = LoginWorker(url: url, httpClient: alamofireAdapter)
        let authentication = Authentication(user: "user@email.com", password: "123")
        let exp = expectation(description: "wating")
        sut.auth(authentication: authentication) { result in
            switch result {
            case .failure:
                XCTFail("Expect sucess got \(result) instead")
            case .success(let data):
                XCTAssertNotNil(data.id)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
}
