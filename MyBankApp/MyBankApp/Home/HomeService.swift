import Foundation

protocol HomeServiceProtocol {
    func fetchStatements(for id: String, completion: @escaping (Result<HomeResponse, NetworkError>) -> Void)
}

final class HomeService: HomeServiceProtocol {
    private let networkService: NetworkService
    
    init(networkService: NetworkService = NetworkServiceImpl()) {
        self.networkService = networkService
    }
    
    func fetchStatements(
        for id: String,
        completion: @escaping (Result<HomeResponse, NetworkError>) -> Void
    ) {
        guard let url = URL(string: "https://6092aef785ff5100172136c2.mockapi.io/api/statements/\(id)") else {
            completion(.failure(.invalidResponse))
            return
        }
        
        networkService.request(
            url: url,
            method: .get,
            bodyParameters: nil
        ) { (result: Result<HomeResponse, NetworkError>) in
            completion(result)
        }
    }
}

/*
 let homeService = HomeService()

 homeService.fetchStatements(for: "your-id") { result in
     switch result {
     case .success(let statements):
         // Handle successful fetch
         for statement in statements {
             print("Statement ID:", statement.id)
             print("Type:", statement.type)
             print("Date:", statement.date)
             print("Detail:", statement.detail)
             print("Value:", statement.value)
             print("--------")
         }
     case .failure(let error):
         // Handle fetch error
         print("Fetch error:", error.localizedDescription)
     }
 }
 */
