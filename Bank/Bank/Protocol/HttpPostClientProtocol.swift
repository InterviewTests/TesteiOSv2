import Foundation

public protocol HttpPostClientProtocol {
    func post(to url: URL, with data: Data?, completion: @escaping (Result<Data?, MessageError>) -> Void)
}
