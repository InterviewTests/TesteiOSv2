//
//  LoginViewController.swift
//  BankInterviewApp
//
//  Created by Osias Carneiro on 10/03/20.
//  Copyright (c) 2020 Osias Carneiro. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginDisplayLogic: class
{
    func error()
    func loginSucess()
}

class LoginViewController: UIViewController, LoginDisplayLogic
{
    
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
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
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
    addCpfMask(field: user)
  }
    
    func addCpfMask(field: UITextField)
    {
        user.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        guard let text = textField.text, !text.isEmpty else { return }
        if let isNumber = textField.text?.first?.isNumber, isNumber, !text.contains("@") {
            textField.text = text.applyPatternOnNumbers(pattern: "###.###.###-##", replacmentCharacter: "#")
        }
    }
  
  // MARK: User & Password
  
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    
 // MARK: Login
  
  @IBAction func login()
  {
    let request = Login.Request(user: user.text!, password: password.text!)
    interactor?.doLogin(request: request)
  }
}
