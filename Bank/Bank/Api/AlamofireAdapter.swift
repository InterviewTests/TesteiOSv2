import Alamofire
import Foundation

public class AlamofireAdapter: HttpPostClientProtocol {

    private let session: Session

    public init(session: Session = .default) {
        self.session = session
    }

    public func post(to url: URL, with data: Data?, completion: @escaping (Result<Data?, MessageError>) -> Void) {
        session.request(url, method: .post, parameters: data?.toJson(), encoding: JSONEncoding.default)
            .responseData { dataResponse in

            guard let statusCode = dataResponse.response?.statusCode else {
                return completion(.failure(.unexpected))
            }

            switch dataResponse.result {
            case .success(let data):
                switch statusCode {
                case 204:
                    completion(.success(nil))
                case 200...299:
                    completion(.success(data))
                case 401:
                    completion(.failure(.unauthorized))
                case 403:
                    completion(.failure(.forbidden))
                case 400...499:
                    completion(.failure(.badRequest))
                case 500...599:
                    completion(.failure(.serverError))
                default:
                    completion(.failure(.noConnectivity))
                }
            case .failure:
                completion(.failure(.unexpected))
            }
        }
    }
}

extension AlamofireAdapter: HttpGetClientProtocol {

    public func get(to url: URL, completion: @escaping (Result<Data?, MessageError>) -> Void) {
        
        session.request(url, method: .get, encoding: JSONEncoding.default)
            .responseData { dataResponse in

            guard let statusCode = dataResponse.response?.statusCode else {
                return completion(.failure(.unexpected))
            }

            switch dataResponse.result {
            case .success(let data):
                switch statusCode {
                case 204:
                    completion(.success(nil))
                case 200...299:
                    completion(.success(data))
                case 401:
                    completion(.failure(.unauthorized))
                case 403:
                    completion(.failure(.forbidden))
                case 400...499:
                    completion(.failure(.badRequest))
                case 500...599:
                    completion(.failure(.serverError))
                default:
                    completion(.failure(.noConnectivity))
                }
            case .failure:
                completion(.failure(.unexpected))
            }
        }
    }
}


