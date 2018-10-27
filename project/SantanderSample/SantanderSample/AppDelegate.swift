//
//  AppDelegate.swift
//  SantanderSample
//
//  Created by Virgilius Santos on 26/10/18.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Instantiate a window.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        
        // Instantiate the root view controller with dependencies injected by the container.
        window.rootViewController = Assembly.shared.loginVC
        
        return true
    }

}

