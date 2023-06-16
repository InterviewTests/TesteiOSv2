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

enum ServiceError: Error {
    case invalidUrl
    case decodeFail(Error?)
    case network(Error?)
}

class NetworkService<R : Codable> {

    // MARK: - Properties

    typealias Response = R
    private let endpoint: Endpoint

    // MARK: - Initializers
    init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }

    func request(pathParameter: PathParameter?, completion: @escaping (Result<Response, ServiceError >) -> Void)  {
        var path = ""
        if let pathParameter = pathParameter {
            path = endpoint.fullPath.replacingOccurrences(of: ":\(pathParameter.name)", with: pathParameter.value)
        } else{
            path = endpoint.fullPath
        }

        guard let url = URL(string: path) else {
            completion(.failure(.invalidUrl))
            return;
        }
        printIfDebug(path)

        var request = URLRequest(url: url)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")        // the expected response is also JSON
        request.httpMethod = endpoint.method.rawValue

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(.network(error)))
                return
            }
            do{
                let body = try JSONDecoder().decode(Response.self, from: data)
                completion(.success(body))
            }catch {
                printIfDebug("\(error)")
                completion(.failure(.decodeFail(error)))
            }

        }
        task.resume()
    }
}
