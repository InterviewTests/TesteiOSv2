//
//  LoginRouter.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 15/02/19.
//  Copyright (c) 2019 Gilson Gil. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol LoginRoutingLogic {
  func routeToAccount()
}

protocol LoginDataPassing {
  var dataStore: LoginDataStore? { get }
}

final class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
  weak var viewController: LoginViewController?
  var dataStore: LoginDataStore?

  // MARK: Routing

  func routeToAccount() {
    let viewController = AccountViewController()
    guard let loginViewController = self.viewController,
      let sourceDataStore = self.dataStore,
      var destinationDataStore = viewController.router?.dataStore else { return }
    passDataToAccount(source: sourceDataStore, destination: &destinationDataStore)
    navigateToAccount(source: loginViewController, destination: viewController)
  }

  // MARK: Navigation

  func navigateToAccount(source: LoginViewController, destination: AccountViewController) {
    source.view.window?.transition(from: source, to: destination)
  }

  // MARK: Passing data

  func passDataToAccount(source: LoginDataStore, destination: inout AccountDataStore) {
    destination.userAccount = source.userAccount
  }
}
