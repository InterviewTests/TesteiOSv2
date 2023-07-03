import XCTest
@testable import MyBankApp

final class LoginConfiguratorTests: XCTestCase {
    
    private var sut: LoginConfigurator!
    
    override func setUp() {
        super.setUp()
        sut = LoginConfigurator()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_setup() {
        // When
        let viewController = sut.setup()

        // Then
        XCTAssertNotNil(viewController)

        let interactor = Mirror(reflecting: viewController).firstChild(of: LoginInteractor.self, in: "interactor")
        XCTAssertNotNil(interactor)
        XCTAssertTrue(interactor?.presenter is LoginPresenter)

        let presenter = Mirror(reflecting: interactor!).firstChild(of: LoginPresenter.self, in: "presenter")
        XCTAssertNotNil(presenter)
        XCTAssertTrue(presenter?.viewController === viewController)

        let router = Mirror(reflecting: viewController).firstChild(of: LoginRouter.self, in: "router")
        XCTAssertNotNil(router)
        XCTAssertTrue(router?.viewController === viewController)
        XCTAssertTrue(router?.dataStore as? LoginInteractor === interactor)
    }
    
/// *
/// This next test is another approach for the same purpose
/// *
///    func test_setup2() {
///        // When
///        let viewController = sut.setup()
///
///        // Then
///        XCTAssertNotNil(viewController)
///
///        let interactor = viewController.interactor as? LoginInteractor
///        XCTAssertNotNil(interactor)
///        XCTAssertTrue(interactor?.presenter is LoginPresenter)
///
///        let presenter = interactor?.presenter as? LoginPresenter
///        XCTAssertNotNil(presenter)
///        XCTAssertTrue(presenter?.viewController === viewController)
///
///        let router = viewController.router as? LoginRouter
///        XCTAssertNotNil(router)
///        XCTAssertTrue(router?.viewController === viewController)
///    }
}

