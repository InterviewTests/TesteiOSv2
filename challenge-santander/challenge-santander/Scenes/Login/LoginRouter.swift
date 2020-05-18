//
//  LoginRouter.swift
//  challenge-santander
//
//  Created by Hugo Ferreira on 18/05/20.
//  Copyright (c) 2020 Hugo Ferreira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol LoginRoutingLogic
{
  func routeToAccountDetails(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing
{
    var dataStore: LoginModel.UserModel? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic
{
  weak var viewController: LoginViewController?
  var dataStore: LoginModel.UserModel?
  
  // MARK: Routing
    
    func routeToAccountDetails(segue: UIStoryboardSegue?) {
        
    }
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: LoginViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: LoginDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
