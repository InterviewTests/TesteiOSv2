import UIKit

@objc protocol LoginRoutingLogic {
    func routeToStatement()
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    // MARK: Routing
    
    func routeToStatement() {
      
        let destinationVC = CurrencyViewController()
        var destinationDS = destinationVC.router?.dataStore
        
        if destinationDS != nil, let ds = dataStore {
            passDataToCurrency(source: ds, destination: &destinationDS!)
        }
        navigateToCurrency(source: viewController!, destination: destinationVC)
    }
    
    // MARK: Navigation
    
    func navigateToCurrency(source: LoginViewController, destination: CurrencyViewController) {
      
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToCurrency(source: LoginDataStore, destination: inout CurrencyDataStore) {
      
        destination.user = source.user
    }
}
