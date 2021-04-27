import UIKit

protocol CurrencyBusinessLogic {
    func getStatements(request: Currency.StatementModel.Request)
}

protocol CurrencyDataStore {
    var user: User? { get set }
}

class CurrencyInteractor: CurrencyBusinessLogic, CurrencyDataStore {
    var presenter: CurrencyPresentationLogic?
    var worker: CurrencyWorker?
    var user: User?
    
    // MARK: Do something
    
    func getStatements(request: Currency.StatementModel.Request) {
        worker = CurrencyWorker(url: makeApiUrl(path: Endpoint.getEndpoint(.statement(id: request.userID))()), httpClient: AlamofireAdapter())
        worker?.get(completion: { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let statements):
                let response = Currency.StatementModel.Response(statements: statements)
                self.presenter?.presentStatements(response: response)
                
            case .failure(let error):
                self.presenter?.presentError(error: error)
            }
        })
    }
}
