//
//  ViewController.swift
//  Bank App
//
//  Created by Chrystian on 21/11/18.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import UIKit

protocol LoginControllerDisplayLogic: class {
    
    func displayIntroForUser(userModel: LoginObject.FetchLogin.ViewModel?)
}

class LoginViewController: UIViewController, LoginControllerDisplayLogic {
    
    // declara as variaveis que ficam acoplada aos protocolos.
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol)?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
//        let router = ShowOrderRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
//        router.viewController = viewController
//        router.dataStore = interactor
    }
    
    func fetchUser() {
        let request = UserLogin.FetchUser.Resquest()
        interactor?.fetchUser(request: request)
    }
    
    @IBAction func actionLogin(_ action: Any) {
        fetchUser()
    }
    
    func displayIntroForUser(userModel: LoginObject.FetchLogin.ViewModel?) {
        // ... perform segue to intro cotroller, pass de usar for another screen.
        
        if let userModel = userModel {
            performSegue(withIdentifier: "________________", sender: userModel.user)
        }
        else {
            showErrorForLogin(error: .loginError)
        }
    }
    
    func showErrorForLogin(error: ErrorType) {
        // ... perform error in view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
}
