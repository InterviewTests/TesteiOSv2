import UIKit

class CurrencyWorker : StatementProtocol {
    
    private let url: URL
    private let httpClient: HttpGetClientProtocol
    
    init(url: URL, httpClient: HttpGetClientProtocol) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func get(completion: @escaping (ServiceReturnType) -> Void) {
        
        httpClient.get(to: url) { [weak self] result in
            guard self != nil else { return }

            switch result {
            case .success(let data):
                guard let model: [Statement] = data?.toModel() else {
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
