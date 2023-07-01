import Foundation

protocol NetworkService {
    func request<T: Decodable>(url: URL, method: HTTPMethod, bodyParameters: [String: Any]?,
                               completion: @escaping (Result<T, NetworkError>) -> Void)
}

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}
