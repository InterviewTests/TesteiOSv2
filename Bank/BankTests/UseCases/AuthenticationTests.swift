import XCTest
@testable import Bank

class AuthenticationTests: XCTestCase {

    func test_autenticacao_deve_chamar_httpClient_com_url_correta() {
        let url = makeUrl()
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.auth(authentication: makeAuthentication()) { _ in }

        XCTAssertEqual(httpClientSpy.url, url)
    }

    func test_autenticacao_deve_chamar_httpClient_com_dados_corretos() {
        let authentication = makeAuthentication()
        let (sut, httpClientSpy) = makeSut()
        sut.auth(authentication: authentication) { _ in }

        XCTAssertEqual(httpClientSpy.data, authentication.toData())
    }

    func test_autenticacao_deve_completar_com_erro_se_client_completar_com_erro() {
        let (sut, httpClientSpy) = makeSut()
        let authentication = makeAuthentication()
        let exp = expectation(description: "waiting")

        sut.auth(authentication: authentication) { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .unexpected)
            case .success:
                XCTFail("Error: Expected error but received \(result) instead")
            }
            exp.fulfill()
        }

        httpClientSpy.completeWith(error: .unexpected)
        wait(for: [exp], timeout: 1)
    }

    func test_autenticacao_deve_completar_com_sessao_expirada_se_client_completar_unauthorized() {
        let (sut, httpClientSpy) = makeSut()
        let authentication = makeAuthentication()
        let exp = expectation(description: "waiting")

        sut.auth(authentication: authentication) { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .expiredSession)
            case .success:
                XCTFail("Error: Expected error but received \(result) instead")
            }
            exp.fulfill()
        }

        httpClientSpy.completeWith(error: .unauthorized)
        wait(for: [exp], timeout: 1)
    }

    func test_autenticacao_deve_complete_com_conta_se_client_completar_com_dados_validos() {
        let (sut, httpClientSpy) = makeSut()
        let authentication = makeAuthentication()
        let expectedAccount = makeLoginResponse()
        let exp = expectation(description: "waiting")

        sut.auth(authentication: authentication) { result in
            switch result {
            case .failure:
                XCTFail("Error: Expected success but received \(result) instead")
            case .success(let receivedAcccount):
                XCTAssertEqual(receivedAcccount, expectedAccount)
            }
            exp.fulfill()
        }

        httpClientSpy.completeWith(data: expectedAccount.toData()!)
        wait(for: [exp], timeout: 1)
    }

    func test_autenticacao_deve_completar_com_erro_se_client_completar_com_dados_nvalidos() {
        let (sut, httpClientSpy) = makeSut()
        let authentication = makeAuthentication()
        let exp = expectation(description: "waiting")

        sut.auth(authentication: authentication) { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .unexpected)
            case .success:
                XCTFail("Error: Expected error but received \(result) instead")
            }
            exp.fulfill()
        }

        httpClientSpy.completeWith(data: makeInvalidData())
        wait(for: [exp], timeout: 1)
    }
}
