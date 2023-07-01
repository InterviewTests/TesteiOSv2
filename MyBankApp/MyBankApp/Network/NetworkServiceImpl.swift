import Foundation

final class NetworkServiceImpl: NetworkService {
    private let urlSession: URLSessionProtocol
    
    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func request<T: Decodable>(
        url: URL,
        method: HTTPMethod,
        bodyParameters: [String: Any]?,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        // Set body parameters if available
        if let bodyParameters = bodyParameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: bodyParameters)
        }
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            // Check for network errors
            if let _ = error {
                completion(.failure(NetworkError.requestFailed))
                return
            }
            
            // Check for invalid response
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(NetworkError.invalidResponse))
                    return
            }
            
            // Parse the response data
            guard let responseData = data else {
                completion(.failure(NetworkError.decodingFailed))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: responseData)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(NetworkError.decodingFailed))
            }
        }
        
        task.resume()
    }
}
