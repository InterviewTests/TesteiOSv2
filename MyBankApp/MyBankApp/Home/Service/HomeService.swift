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
        //id should be used at the end of the URL, but as the API is not working properly, i will not add the id at the end
        guard let url = URL(string: "https://6092aef785ff5100172136c2.mockapi.io/api/statements") else {
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
