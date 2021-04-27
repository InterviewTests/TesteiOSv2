import UIKit

public class LoginWorker : AuthenticationProtocol {
    
    private let url: URL
    private let httpClient: HttpPostClientProtocol
    
    public init(url: URL, httpClient: HttpPostClientProtocol) {
        self.url = url
        self.httpClient = httpClient
    }
    
    public func auth(authentication: Authentication, completion: @escaping (ServiceReturnType) -> Void) {
        
        httpClient.post(to: url, with: authentication.toData()) { [weak self] result in
            guard self != nil else { return }

            switch result {
            case .success(let data):
                guard let model: User = data?.toModel() else {
                    completion(.failure(.unexpected))
                    return
                }
                completion(.success(model))
            case .failure(let error):
                switch error {
                case .unauthorized:
                    completion(.failure(.expiredSession))
                default:
                    completion(.failure(.unexpected))
                }
            }
        }
    }
}
