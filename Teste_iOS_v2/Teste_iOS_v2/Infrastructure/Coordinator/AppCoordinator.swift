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
        coordinator.appCoordinatorDelegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    internal func initiateTimelineFlow(with userInformations: UserAccount?) {
        let coordinator = TimelineCoordinator(navigationController: navigationController, userInformations: userInformations, needToSetAsRoot: true)
        coordinator.appCoordinatorDelegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        appDelegate.changeRootViewController(coordinator.navigationController)
    }
    
    internal func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        for (index, child) in childCoordinators.enumerated() where child === childCoordinator {
            childCoordinators.remove(at: index)
        }
    }
    
}
