import Foundation

public protocol HttpGetClientProtocol {
    func get(to url: URL, completion: @escaping (Result<Data?, MessageError>) -> Void)
}
