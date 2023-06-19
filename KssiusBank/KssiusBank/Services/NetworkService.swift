import Foundation

func printIfDebug(_ string: String) {
    #if DEBUG
    print(string)
    #endif
}


struct PathParameter {
    let name: String
    let value: String
}

struct NetworkConfiguration {
    let baseUrl: String
}

struct Endpoint {
    typealias RawValue = Int

    enum Method: String {
        case get, post
    }
    let path: String
    let method: Method
    let configuration: NetworkConfiguration

    var fullPath: String  {
        "\(configuration.baseUrl)/\(path)"
    }

}

enum ServiceError: Error, Equatable {
    static func == (lhs: ServiceError, rhs: ServiceError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidUrl, .invalidUrl): return true
        case (.noData, .noData): return true
        case (.decodeFail(let lnet), .decodeFail(let rnet)) :
            return lnet == rnet
        case (.network(let lnet), .network(let rnet)) :
            return lnet == rnet
        default:
            return false
        }
    }

    case invalidUrl
    case noData
    case decodeFail(ErrorResponse?)
    case network(ErrorResponse?)
}

class NetworkService<R : Codable> {

    // MARK: - Properties

    typealias Response = R
    let urlSession: URLSession

    // MARK: - Initializers
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func request(endpoint: Endpoint, payload: Encodable? = nil, completion: @escaping (Result<Response, ServiceError>) -> Void)  {
        let path = endpoint.fullPath
        guard let url = URL(string: path) else {
            completion(.failure(.invalidUrl))
            return;
        }
        printIfDebug(path)

        var request = URLRequest(url: url)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpMethod = endpoint.method.rawValue

        if let payload = payload, let encodablePayload = try? JSONEncoder().encode(payload) {
            request.httpBody = encodablePayload
        }

        let task = urlSession.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do{
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let body = try decoder.decode(Response.self, from: data)
                completion(.success(body))
            }catch {
                printIfDebug("\(error)")
                completion(.failure(.decodeFail(.init(message: error.localizedDescription))))
            }

        }
        task.resume()
    }
}
