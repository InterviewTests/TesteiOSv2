import Foundation

final class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    
    var user: LoginResponse?
    
    var presenter: HomePresentationLogic?
    let homeService: HomeServiceProtocol
    
    init(presenter: HomePresentationLogic? = nil, homeService: HomeServiceProtocol = HomeService()) {
        self.presenter = presenter
        self.homeService = homeService
    }
    
    func fetchUserStatements() {
        homeService.fetchStatements(for: user?.userId ?? "") { [weak self, presenter] result in
            switch result {
            case .success(let response):
                guard let self = self else { return }
                print("Statements:", response.statement)
//                statements = response.statement
                presenter?.presentStatementsSuccess(response.statement)
            case .failure(let error):
                print("Statements error:", error.localizedDescription)
                presenter?.presentStatementsError(message: "")
            }
        }
    }
}
