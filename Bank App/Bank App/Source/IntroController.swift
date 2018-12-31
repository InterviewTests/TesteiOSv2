//
//  IntroViewController.swift
//  Bank App
//
//  Created by Chrystian on 24/11/18.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation
import UIKit


protocol IntroDisplayLogic: class {
    
    func displayData()
    func showError(_ alertController: UIAlertController)
    func presentDetailController()
}

class IntroController: UIViewController, IntroDisplayLogic {
    
    @IBOutlet weak var userTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    var interactor: IntroInteractorLogic?
    var router: (NSObjectProtocol & IntroRouterLogic)?
    
    // MARK: Object lifecycle
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
        let interactor = IntroInteractor()
        let presenter = IntroPresenter()
        let router = IntroRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    /// Recive some object to display in view controller.
    func displayData() {
        // ...
    }
    
    func showError(_ alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
    
    func presentDetailController() {
        router?.routeToBankHistory(segue: nil)
    }
    
    private func getDataFromDisplay() -> UserLogin? {
        var userLogin = UserLogin()
        userLogin.user = userTf.text
        userLogin.password = passwordTf.text
        
        return userLogin
    }
    
    // Mark: Actions
    @IBAction func actionLogin(_ sender: Any) {
        guard let userData = getDataFromDisplay() else { return }
        interactor?.loginUser(user: userData)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let scene = segue.identifier else { return }
        
        let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
        guard let router = router, router.responds(to: selector) else { return }
        router.perform(selector)
    }
}
