//
//  Assembly.swift
//  SantanderSample
//
//  Created by Virgilius Santos on 27/10/18.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import UIKit
import Swinject

class Assembly {
    
    private var container: Container
    
    lazy var loginVC: LoginViewController?
        = container.resolve(LoginViewController.self)
    
    lazy var detailVC: DetailsViewViewController?
        = container.resolve(DetailsViewViewController.self)
    
    static let shared = Assembly()
    private init() {
        container = Container()
        
        container.register(ServiceManager.self) { _ in
            return ServiceManager()
            }.inObjectScope(.container)
        
        setupLoginVC()
        setupDetailVC()
    }
    
    func setupLoginVC() {
        
        container.register(LoginWorker.self) { r in
            let worker = LoginWorker()
            worker.serviceManager = r.resolve(ServiceManager.self)
            return worker
        }
        container.register(LoginInteractor.self) { r in
            let interactor = LoginInteractor()
            interactor.worker = r.resolve(LoginWorker.self)
            return interactor
        }
        container.register(LoginPresenter.self) { _ in
            return LoginPresenter()
        }
        container.register(LoginRouter.self) { r in
            let router = LoginRouter()
            router.dataStore = r.resolve(LoginInteractor.self)
            return router
        }
        container.register(LoginViewController.self) { r in
            let nibName = String(describing: LoginViewController.self)
            let controller = LoginViewController.init(nibName: nibName, bundle: nil)
            let interactor = r.resolve(LoginInteractor.self)
            let presenter = r.resolve(LoginPresenter.self)
            let router = r.resolve(LoginRouter.self)
            
            controller.interactor = interactor
            controller.router = router
            router?.viewController = controller
            interactor?.presenter = presenter
            presenter?.viewController = controller
            
            return controller
        }
    }
    
    func setupDetailVC() {
        container.register(DetailWorker.self) { r in
            let worker = DetailWorker()
            worker.serviceManager = r.resolve(ServiceManager.self)
            return worker
        }
        container.register(DetailInteractor.self) { r in
            let interactor = DetailInteractor()
            interactor.worker = r.resolve(DetailWorker.self)
            return interactor
        }
        container.register(DetailPresenter.self) { _ in
            return DetailPresenter()
        }
        container.register(DetailRouter.self) { r in
            let router = DetailRouter()
            router.dataStore = r.resolve(DetailInteractor.self)
            return router
        }
        container.register(DetailsViewViewController.self) { r in
            let nibName = String(describing: DetailsViewViewController.self)
            let controller = DetailsViewViewController.init(nibName: nibName, bundle: nil)
            
            let interactor = r.resolve(DetailInteractor.self)
            let presenter = r.resolve(DetailPresenter.self)
            let router = r.resolve(DetailRouter.self)
            
            controller.interactor = interactor
            controller.router = router
            router?.viewController = controller
            interactor?.presenter = presenter
            presenter?.viewController = controller
            
            return controller
        }
    }
}
