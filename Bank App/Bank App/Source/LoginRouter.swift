//
//  LoginRouter.swift
//  Bank App
//
//  Created by Chrystian on 24/11/18.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation
import UIKit

/// Defines all segues to push
protocol LoginRoutingLogic {
    
    func showIntroController(segue: UIStoryboardSegue?)
}

protocol LoginDataParsing {
    
    var userData: UserData? { get }
}

class LoginRouter: NSObject, LoginDataParsing, LoginRoutingLogic {
    
    weak var viewController: LoginViewController?
    var userData: UserData?
    
    func showIntroController(segue: UIStoryboardSegue?) {
        if let segue = segue {
            guard let destinationVC = segue.destination as? IntroViewController else { return }
//            guard let destinationDS = destinationVC.router?.dataStore?
            
        }
        else {
            let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "ShowIntroViewController") as! IntroViewController
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToShowOrder(source: dataStore!, destination: &destinationDS)
//            navigateToShowOrder(source: viewController!, destination: destinationVC)
        }
    }
}

extension LoginRouter {
    
    func navigateToIntroController(source: LoginViewController, destination: IntroViewController) {
        source.show(destination, sender: nil)
    }
    
    func passDataToIntroController(source: UserData, destination: inout UserHistoryData) {
        destination.user = source.user
    }
}
