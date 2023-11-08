import XCTest
@testable import MyBankApp

final class LoginViewControllerSpy: LoginViewController {
    var navigationControllerSpy: NavigationControllerSpy?

    override var navigationController: UINavigationController? {
        return navigationControllerSpy
    }
}
