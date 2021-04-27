import Foundation
import Bank

extension AuthenticationTests {

    func makeSut(url: URL = URL(string: "http://url.com")!,
                 file: StaticString = #file,
                 line: UInt = #line) -> (sut: LoginWorker, httpClientSpy: HttpClientSpy) {
        let url = url
        let httpClientSpy = HttpClientSpy()
        let sut = LoginWorker(url: url, httpClient: httpClientSpy)

        checkMemoryLeak(for: httpClientSpy, file: file, line: line)
        checkMemoryLeak(for: sut, file: file, line: line)

        return (sut, httpClientSpy)
    }
}
