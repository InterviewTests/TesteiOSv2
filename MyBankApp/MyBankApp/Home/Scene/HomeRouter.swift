import UIKit

final class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    func logout() {
        viewController?.navigationController?.popViewController(animated: true)
    }
//    func routeToStatementDetail() {
//
//    }
}
