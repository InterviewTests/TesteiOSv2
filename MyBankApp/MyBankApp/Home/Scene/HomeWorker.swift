import Foundation

protocol HomeWorkerProtocol {
    func fetchStatements(for id: String, completion: @escaping (Result<HomeResponse, NetworkError>) -> Void)
}

final class HomeWorker: HomeWorkerProtocol {
    
    private var homeService: HomeServiceProtocol
    
    init(homeService: HomeServiceProtocol = HomeService()) {
        self.homeService = homeService
    }
    
    func fetchStatements(for id: String, completion: @escaping (Result<HomeResponse, NetworkError>) -> Void) {
        homeService.fetchStatements(for: id, completion: completion)
    }
}
