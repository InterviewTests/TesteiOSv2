import UIKit

final class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    func routeToHome() {
        let homeViewController = UIViewController()
//        let homeDataStore = homeViewController.router?.dataStore
//        home.user = viewController?.user
        viewController?.show(homeViewController, sender: nil)
//        viewController?.navigationController?.pushViewController(homeViewController, animated: true)
    }
}
