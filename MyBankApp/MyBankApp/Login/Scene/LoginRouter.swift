import UIKit

final class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    func routeToHome() {
        let homeViewController = HomeConfigurator().setup()
        var homeDataStore = homeViewController.router?.dataStore
        let mockUserResponse = LoginResponse(
            userId: "1",
            email: "jose_da_silta@teste.com6",
            cpf: "123.456.789-10",
            name: "José da Silva Teste",
            accountNumber: "2050 / 01.111222-4",
            agency: "0",
            balance: "R$ 1.000,00"
        )
        homeDataStore?.user = mockUserResponse//dataStore?.user
        homeViewController.navigationItem.setHidesBackButton(true, animated: false)
        viewController?.navigationController?.pushViewController(homeViewController, animated: true)
    }
}
