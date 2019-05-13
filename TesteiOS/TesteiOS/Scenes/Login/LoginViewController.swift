//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright (c) 2019 Fabio Morais. All rights reserved.

import UIKit

protocol LoginDisplayLogic: class {
    func getData(viewModel: LoginModel.Login.ViewModel)
    func saveUserName(username: String)
    func showAlertError(message: String)
}

class LoginViewController: UIViewController {
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

    // MARK: Outlets
    @IBOutlet weak var bankLogo: UIImageView!
    @IBOutlet weak var userIdentificationTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    var keyboardIsOnTheScreen = false
    
    // MARK: Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getLastUsername()
        self.dismissKeyboardWhenTappedAround()
        setupKeyboardNotification()
    }
    
    //MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        adjustInsetForKeyboardShow(show: true, notification: notification)
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        adjustInsetForKeyboardShow(show: false, notification: notification)
    }
    
    private func adjustInsetForKeyboardShow(show: Bool, notification: NSNotification) {
        let userInfo = notification.userInfo ?? [:]
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let adjustment = keyboardFrame.height + 20

        if show && keyboardIsOnTheScreen == true {
            
        }else if show && keyboardIsOnTheScreen == false  {
            self.scrollView.contentInset.bottom += adjustment
            self.scrollView.scrollIndicatorInsets.bottom += adjustment
            keyboardIsOnTheScreen = true
        }else {
            self.scrollView.contentInset = UIEdgeInsets.zero
            self.scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
            keyboardIsOnTheScreen = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    func getLastUsername() {
        interactor?.getSavedUserName()
    }
    
    func postLogin() {
        UILoader.shared.showLoader(in: view)
        let request = LoginModel.Login.Request(userId: userIdentificationTextField.text, password: passwordTextField.text)
        interactor?.postLogin(request: request)
    }
    
    @IBAction func actLogin(_ sender: UIButton) {
        postLogin()
    }
}

// MARK:- Display logic

extension LoginViewController: LoginDisplayLogic {
    
    func getData(viewModel: LoginModel.Login.ViewModel) {
        UILoader.shared.hideLoader()
        self.performSegue(withIdentifier: Constants.Identifiers.goToStatementSegue, sender: self)
    }
    
    func showAlertError(message: String) {
        UILoader.shared.hideLoader()
        let alert = UIAlertController(title: "atenção", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveUserName(username: String) {
        userIdentificationTextField.text = username
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.returnKeyType {
        case .next:
            passwordTextField.becomeFirstResponder()
            return true
        case .go:
            textField.resignFirstResponder()
            postLogin()
            return true
        default:
            textField.resignFirstResponder()
            return true
        }
    }
}

