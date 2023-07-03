import XCTest
@testable import MyBankApp

final class LoginRouterTests: XCTestCase {
    private var sut: LoginRouter!
    var viewController: LoginViewControllerSpy!
    
    override func setUp() {
        super.setUp()
        sut = LoginRouter()
        viewController = LoginViewControllerSpy()
        sut.viewController = viewController
    }
    
    override func tearDown() {
        viewController = nil
        sut = nil
        super.tearDown()
    }
    
    func test_routeToHome_viewControllerShouldRouteToHomeViewController() {
        let navigationControllerSpy = NavigationControllerSpy()
        viewController.navigationControllerSpy = navigationControllerSpy
        
        sut.routeToHome()
        
        XCTAssertEqual(navigationControllerSpy.calledMethods, [.pushViewControllerType(HomeViewController.self, animated: true)])
    }

}
