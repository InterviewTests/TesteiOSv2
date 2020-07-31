//
//  AppDelegate.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 30/07/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let nav = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = AppCoordinator(navigationController: nav)
        coordinator?.start()
        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }

}

