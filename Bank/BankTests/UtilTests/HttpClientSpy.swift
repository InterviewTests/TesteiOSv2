import Foundation
import Bank

class HttpClientSpy: HttpPostClientProtocol {
    
    var url: URL?
    var data: Data?
    var completion: ((Result<Data?, MessageError>) -> Void)?

    func post(to url: URL, with data: Data?, completion: @escaping (Result<Data?, MessageError>) -> Void) {
        self.url = url
        self.data = data
        self.completion = completion
    }

    func completeWith(error: MessageError) {
        completion?(.failure(error))
    }

    func completeWith(data: Data) {
        completion?(.success(data))
    }
}

extension HttpClientSpy: HttpGetClientProtocol {
    
    func get(to url: URL, completion: @escaping (Result<Data?, MessageError>) -> Void) {
        self.url = url
        self.completion = completion
    }
}
