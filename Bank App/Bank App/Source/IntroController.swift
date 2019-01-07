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
    func configureLoginAnimationLoading()
    func configureLoginAnimationCompletion()
}

class IntroController: UIViewController, IntroDisplayLogic {
    
    @IBOutlet weak var userTf: UITextField!
    @IBOutlet weak var stackViewFields: UIStackView!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var containerFields: UIView!
    
    var interactor: IntroInteractorLogic?
    var router: (NSObjectProtocol & IntroRouterLogic)?
    
    var loadingView: LoadingView?
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
        tryAutoLogin()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        tryAutoLogin()
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
    
    private func tryAutoLogin() {
        interactor?.tryAutoLogin()
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
    
    func configureLoginAnimationLoading() {
        self.loadingView = LoadingView()
        loadingView?.show(in: self.view)
        
        stackViewFields.alpha = 0
        btnLogin.isUserInteractionEnabled = false
    }
    
    func configureLoginAnimationCompletion() {
        self.loadingView?.dismiss()
        
        stackViewFields.alpha = 1
        btnLogin.isUserInteractionEnabled = true
    }
    
    // Mark: Actions
    @IBAction func actionLogin(_ sender: Any) {
        guard let userData = getDataFromDisplay() else { return }
        interactor?.loginUser(user: userData)
    }
    
    @IBAction func unwindToIntroController(segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let scene = segue.identifier else { return }
        
        let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
        guard let router = router, router.responds(to: selector) else { return }
        router.perform(selector)
    }
}
