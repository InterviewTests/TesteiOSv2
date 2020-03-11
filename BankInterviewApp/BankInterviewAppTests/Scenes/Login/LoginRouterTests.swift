//
//  LoginRouterTests.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import XCTest
import UIKit

class LoginRouterTests: XCTestCase {
    
    private func createLoginVC() -> LoginViewController {
        let bundle = Bundle(for: type(of: self))
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let createOrderViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        _ = createOrderViewController.view
        return createOrderViewController
    }
    
    private func createStatementsVC() -> StatementsViewController {
        let bundle = Bundle(for: type(of: self))
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let createOrderViewController = storyboard.instantiateViewController(withIdentifier: "StatementsViewController") as! StatementsViewController
        _ = createOrderViewController.view
        return createOrderViewController
    }
    
    override func setUp() {
        
    }
    
    func testRouteToSomewhere() {
        let source = createLoginVC()
        let destination = createStatementsVC()
        let router = source.router as! LoginRouter
        let segue = UIStoryboardSegue(identifier: "LoginViewControllerSegue", source: source, destination: destination)
        
        router.dataStore = LoginDataStoreSpy()
        
        router.routeToSomewhere(segue: segue)
        
        XCTAssert(destination.router?.dataStore?.userData != nil && destination.router!.dataStore!.userData!.name == "Joao dos testes")
    }
    
    func testRouteWithNilResponse() {
        let source = createLoginVC()
        let destination = createStatementsVC()
        let router = source.router as! LoginRouter
        let segue = UIStoryboardSegue(identifier: "LoginViewControllerSegue", source: source, destination: destination)
        
        let spy = LoginDataStoreSpy()
        spy.nilResponse = true
        router.dataStore = spy
        
        router.routeToSomewhere(segue: segue)
        
        XCTAssert(destination.router?.dataStore?.userData == nil)
    }
    
    func testRouteToStatements() {
        let router = LoginRouter()
        let bundle = Bundle(for: type(of: self))
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let nvc = storyboard.instantiateViewController(identifier: "NavigationController") as UINavigationController
        router.viewController = nvc.viewControllers.first as? LoginViewController
        
        router.routeToStatements()
        
        //TODO: Como checar o segue?
    }
    
}
