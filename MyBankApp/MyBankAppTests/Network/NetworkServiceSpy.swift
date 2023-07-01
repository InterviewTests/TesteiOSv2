@testable import MyBankApp
import XCTest

typealias NetworkServiceDummy = NetworkServiceSpy

final class NetworkServiceSpy: NetworkService {
    var capturedURL: URL?
    var capturedMethod: HTTPMethod?
    var capturedBodyParameters: [String: Any]?
    var mockedResult: Result<Data?, Error>?
        
    func request<T>(url: URL, method: HTTPMethod, bodyParameters: [String: Any]?, completion: @escaping (Result<T, NetworkError>) -> Void) where T: Decodable {
        capturedURL = url
        capturedMethod = method
        capturedBodyParameters = bodyParameters
        
        switch mockedResult {
        case .success(let data):
            if let data = data {
                do {
                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedObject))
                } catch {
                    completion(.failure(.decodingFailed))
                }
            } else {
                completion(.failure(.noData))
            }
        case .failure(_):
            completion(.failure(.requestFailed))
        case .none:
            completion(.failure(.unknownError))
        }
    }
}
