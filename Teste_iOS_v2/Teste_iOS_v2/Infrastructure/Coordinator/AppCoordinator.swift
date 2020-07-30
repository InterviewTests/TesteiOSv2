//
//  AppCoordinator.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 30/07/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

class AppCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    var childCoordinators = [CoordinatorProtocol]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        initiateLoginFlow()
    }
    
    private func initiateLoginFlow() {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
}
