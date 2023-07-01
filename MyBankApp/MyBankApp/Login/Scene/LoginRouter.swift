import UIKit

final class LoginRouter: LoginRoutingLogic, LoginDataStore {
    weak var viewController: LoginViewController?
    var dataToPass: String?
    
    func routeToNextScene() {
        let homeViewController = UIViewController()
        //homeViewController.id = dataToPass
        viewController?.navigationController?.pushViewController(homeViewController, animated: true)
//        viewController?.present(homeViewController, animated: true)
    }
}
