//
//  IntroController.swift
//  Bank App
//
//  Created by Chrystian on 24/11/18.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation
import UIKit


protocol IntroDisplayLogic: class {
    
    func displayData()
    func setupStatusBar(statusBarStyle: UIStatusBarStyle, backgroudColor: UIColor?)
    func showError(_ alertController: UIAlertController)
    func configureInvalidPassword()
    func presentDetailController()
    func configureLoginAnimationLoading()
    func configureLoginAnimationCompletion()
    func enableLogin(_ enabled: Bool)
}

class IntroController: UIViewController, IntroDisplayLogic {
    
    @IBOutlet weak var userTf: UITextField!
    @IBOutlet weak var stackViewFields: UIStackView!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var containerFields: UIView!
    
    var interactor: IntroBusinessLogic?
    var router: (NSObjectProtocol & IntroRouterLogic)?
    
    var loadingView: LoadingView?
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let scene = segue.identifier else { return }
        
        let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
        guard let router = router, router.responds(to: selector) else { return }
        router.perform(selector)
    }
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTf.delegate = self
        userTf.delegate = self
        
        tryAutoLogin()
        setupUIElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.resetStatusBar()
    }
    
    /// Recive some object to display in view controller.
    func displayData() {
        // ...
    }
    
    func setupStatusBar(statusBarStyle: UIStatusBarStyle, backgroudColor: UIColor?) {
        self.setStatusBarStyle(statusBarStyle, backgroundColor: backgroudColor)
    }
    
    func tryAutoLogin() {
        interactor?.tryAutoLogin()
    }
    
    func showError(_ alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
    
    func configureInvalidPassword() {
        passwordTf.shakeError()
        passwordTf.placeholder = NSLocalizedString("SENHA_INVALIDA", comment: "")
        
        clearTf()
    }
    
    func configureLoginAnimationLoading() {
        loadingView = LoadingView()
        loadingView?.show(in: self.view)
        
        hiddenLoginElements(true)
    }
    
    func configureLoginAnimationCompletion() {
        loadingView?.dismiss()
        
        clearTf()
        hiddenLoginElements(false)
    }
    
    private func hiddenLoginElements(_ hidden: Bool) {
        let _hidden: CGFloat = hidden ? 0 : 1
        stackViewFields.alpha = _hidden
        enableLogin(!hidden)
    }
    
    private func clearTf() {
        userTf.text = ""
        passwordTf.text = ""
    }
    
    func enableLogin(_ enabled: Bool) {
        btnLogin.isEnabled = enabled
        btnLogin.alpha = enabled ? 1 : 0.6
    }
    
    func doLogin() {
        let userLogin = UserLogin(user: userTf.text, password: passwordTf.text)
        interactor?.loginUser(user: userLogin)
    }
    
    func presentDetailController() {
        router?.routeToBankHistory(segue: nil)
    }
    
    // MARK: Actions
    @IBAction func actionLogin(_ sender: Any) {
        doLogin()
    }
    
    @IBAction func unwindToIntroController(segue: UIStoryboardSegue) {
    }
}

extension IntroController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        interactor?.verifyFields([userTf, passwordTf])
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        interactor?.verifyFields([userTf, passwordTf])
        return true
    }
}

extension IntroController {
    
    /// Initialize all ui elements.
    private func setupUIElements() {
        self.userTf.placeholder = NSLocalizedString("EMAIL_PLACEHOLDER", comment: "email placeholder")
        self.passwordTf.placeholder = NSLocalizedString("PASSWORD_PLACEHOLDER", comment: "password placeholder")
        self.enableLogin(false)
    }
}
