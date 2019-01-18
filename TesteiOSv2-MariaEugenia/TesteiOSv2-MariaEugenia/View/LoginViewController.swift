//
//  ViewController.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 10/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var viewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        createCallBacks()
    }
    
  
    func bindViewModel() {
        
        userTextField.rx.text.orEmpty
            .bind(to: viewModel.loginViewModel)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text.orEmpty
            .bind(to: viewModel.passwordViewModel)
            .disposed(by: disposeBag)
        
        loginButton.rx.tap
            .do(onNext:  { [unowned self] in
                let _ = self.userTextField.resignFirstResponder()
                let _ = self.passwordTextField.resignFirstResponder()
            })
            .subscribe {_ in
                self.viewModel.validateUserAndPassword()
            }.disposed(by: disposeBag)
        
        viewModel.isLoading.asObservable()
            .bind { value in
                if value {  self.activityIndicator.startAnimating() }
                else  { self.activityIndicator.stopAnimating() }
            }.disposed(by: disposeBag)
    }
    
    func createCallBacks() {
        
        viewModel.isSuccess.asObservable()
            .bind{ value in
                if value { self.callStatementViewController() }
            }.disposed(by: disposeBag)
        
        viewModel.errorMsg.asObservable()
            .bind { errorMessage in
                if !errorMessage.isEmpty { self.presentMessage(errorMessage) }
            }.disposed(by: disposeBag)
        
    }
    
    func callStatementViewController() {
        let storyboard = UIStoryboard(storyboard: .main)
        let viewController: StatementsViewController = storyboard.instantiateViewController()
        present(viewController, animated: true, completion: nil)
    }
    
    
}


