//
//  AppDelegate.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 28/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(getInitialViewController(), animated: false)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    fileprivate func getInitialViewController() -> UIViewController {
//        return LoginViewController()
        let user = UserAccount(userId: 1, name: "João", bankAccount: "12312-2", agency: "2926-2", balance: 1250.00)
        let statementsVC = StatementsViewController()
        var dataStore = statementsVC.router?.dataStore
        dataStore?.userAccount = user
        return statementsVC
    }
    
}
