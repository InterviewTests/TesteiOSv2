import Foundation

final class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    
    var user: LoginResponse?
    
    var presenter: HomePresentationLogic?
    let worker: HomeWorkerProtocol
    
    init(presenter: HomePresentationLogic? = nil, worker: HomeWorkerProtocol = HomeWorker()) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func fetchUserStatements() {
        worker.fetchStatements(for: user?.userId ?? "") { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                print("Statements:", response.statement)
                self.presenter?.presentStatementsSuccess(response.statement)
            case .failure(let error):
                print("Statements error:", error.localizedDescription)
                self.presenter?.presentStatementsError(message: "")
            }
        }
    }
}
