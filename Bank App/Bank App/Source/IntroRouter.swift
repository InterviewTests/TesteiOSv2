//
//  IntroRouter.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 24/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import UIKit

@objc protocol IntroRouterLogic {
    
    func routeToBankHistory(segue: UIStoryboardSegue?)
}

class IntroRouter: NSObject, IntroRouterLogic {
    
    var dataStore: UserAccountData?
    var viewController: IntroController?
    
    func routeToBankHistory(segue: UIStoryboardSegue?) {
        if let segue = segue {
            if segue.destination is BankHistoryController {
                // ...
            }
        }
        else {
            let storyboard = UIStoryboard(name: "BankHistory", bundle: Bundle(for: self.classForCoder))
            if let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController {
                if let bankHistoryController = navigationController.viewControllers.first as? BankHistoryController {
                    var destinationDS = bankHistoryController.router!.dataStore!
                    passDataToBankHistory(source: dataStore!, destination: &destinationDS)
                    navigateBankHistory(source: viewController!, destination: navigationController)
                }
            }
        }
    }
    
    private func passDataToBankHistory(source: UserAccountData, destination: inout UserAccountData) {
        destination.userAccount?.userId = source.userAccount?.userId
        destination.userAccount?.name = source.userAccount?.name
        destination.userAccount?.bankAccount = source.userAccount?.bankAccount
        destination.userAccount?.agency = source.userAccount?.agency
        destination.userAccount?.balance = source.userAccount?.balance
    }
    
    private func navigateBankHistory(source: IntroController, destination: UINavigationController) {
        source.show(destination, sender: nil)
    }
}
