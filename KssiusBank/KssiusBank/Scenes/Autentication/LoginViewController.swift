//
//  LoginViewController.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 15/06/23.
//  Copyright (c) 2023 Cassio Sousa. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import KeychainSwift

protocol LoginDisplayLogic: AnyObject
{
    func displayUser(viewModel: Login.FetchUser.ViewModel)
    func resolveLogin(viewModel: Login.Login.ViewModel)
}

final class LoginViewController: UIViewController
{

    // MARK: - Constants
    private let defaultButtonBottomSpace = 33.0
    private let segueIdentifier = "PresentHome"

    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup()
    {
        //remote datasource
        let authenticationServiceDataSource = AuthenticationServiceDatasource(networkService: .init())
        let autenticationRepository = AuthenticationRepository(authenticationService: authenticationServiceDataSource)

        //local datasource
        let localDataSource = AuthenticationLocalDatasource(keychain: KeychainSwift())
        let localRepository = AuthenticationLocalRepository(authenticationLocalDataSource: localDataSource)

        let worker = LoginWorker(authenticaionRepository: autenticationRepository)
        let userWork = UserWorker(authenticationLocalRepository: localRepository)
        let viewController = self

        let presenter = LoginPresenter()
        let interactor = LoginInteractor(presenter: presenter, worker: worker, userWork: userWork)
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: View lifecycle

    override func viewDidLoad()
    {
        super.viewDidLoad()
        fetchUser()
        setupUI()
        setupKeyboardHiding()
    }

    // MARK: Login

    @IBOutlet weak var userTextField: DefaultTextField?
    @IBOutlet weak var passwordTextField: DefaultTextField?
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint?
    @IBOutlet weak var contentStack: UIStackView?
    @IBOutlet weak var contentViewTopConstraint: NSLayoutConstraint?
    @IBOutlet weak var loginButton: DefaultButton?
    @IBOutlet weak var indicatorView: UIActivityIndicatorView?
    @IBOutlet weak var errorLabel: UILabel?

    private func setupUI () {
        finishState()
        errorLabel?.isHidden = true
        passwordTextField?.showPasswordToggle()
        userTextField?.returnKeyType = .next

        // delegates
        userTextField?.delegate = self
        passwordTextField?.delegate = self
    }

    // MARK: - keyboard
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(sender: NSNotification) {
        guard let userInfo = sender.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let bottomSafeArea = view.safeAreaInsets.bottom
        let bottomSpace = keyboardFrame.cgRectValue.height + 10
        contentViewTopConstraint?.constant = bottomSafeArea > 0 ? 90 : 30
        if buttonBottomConstraint?.constant ?? 0 == defaultButtonBottomSpace {
            buttonBottomConstraint?.constant = bottomSpace - bottomSafeArea
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0

        buttonBottomConstraint?.constant = defaultButtonBottomSpace
        contentViewTopConstraint?.constant = 105
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

extension LoginViewController: LoginDisplayLogic {
    func displayUser(viewModel: Login.FetchUser.ViewModel) {
        userTextField?.text = viewModel.user
    }

    func resolveLogin(viewModel: Login.Login.ViewModel) {

        if viewModel.success {
            presentHomeScene()
        }else {
            presentError(viewModel: viewModel)
        }

    }
}

// MARK: - UIActions
extension LoginViewController {

    @IBAction func didTapLogin(_ sender: Any) {
        didLogin()
    }

    private func didLogin() {
        startState()
        let userText = userTextField?.text
        let passwordText = passwordTextField?.text
        let request = Login.Login.Request(user: userText, password: passwordText)
        interactor?.login(request: request)
    }

    private func startState() {
        errorLabel?.text = ""
        errorLabel?.isHidden = true
        indicatorView?.isHidden = false
        indicatorView?.startAnimating()
        loginButton?.isEnabled = false
    }

    private func finishState() {
        loginButton?.isEnabled = true
        indicatorView?.stopAnimating()
        indicatorView?.isHidden = true
    }



    private func presentHomeScene() {
        performSegue(withIdentifier: segueIdentifier, sender: self)
        finishState()
    }

    private func presentError(viewModel :Login.Login.ViewModel) {
        errorLabel?.text = viewModel.errorMessage
        errorLabel?.sizeToFit()
        errorLabel?.isHidden = false
        finishState()
    }
}

// MARK: - Fetch User
extension LoginViewController {

    private func fetchUser() {
        interactor?.fetchUser(request: .init())
    }
}

// MARK: - TextField delegate
extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTextField {
            passwordTextField?.becomeFirstResponder()
        }else {
            didLogin()
        }
        return true
    }
}
