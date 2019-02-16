//
//  LoginView.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 15/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import UIKit

import Cartography

protocol LoginViewProperties: class {
  var userTextField: TextField { get }
  var passwordTextField: TextField { get }
  var button: UIButton { get }
}

final class LoginView: UIView, LoginViewProperties {
  private let logoImageView: UIImageView = {
    let image = UIImage.Login.logo
    let imageView = UIImageView(image: image)
    return imageView
  }()

  public private(set) var userTextField: TextField = {
    let textField = TextField()
    textField.placeholder = String.Login.userPlaceholder
    textField.autocapitalizationType = .none
    textField.autocorrectionType = .no
    textField.keyboardType = .emailAddress
    if #available(iOS 10.0, *) {
      textField.textContentType = .emailAddress
    }
    return textField
  }()

  public private(set) var passwordTextField: TextField = {
    let textField = TextField()
    textField.placeholder = String.Login.passwordPlaceholder
    textField.isSecureTextEntry = true
    if #available(iOS 11.0, *) {
      textField.textContentType = .password
    }
    return textField
  }()

  public private(set) lazy var button: UIButton = {
    let button = UIButton()
    button.backgroundColor = .strongBlue
    button.setTitle(String.Login.button, for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 4
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    return button
  }()

  private weak var viewLogic: LoginViewLogic?

  init(viewLogic: LoginViewLogic) {
    self.viewLogic = viewLogic
    super.init(frame: .zero)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    addSubviews()
    addConstraints()

    backgroundColor = .white
  }

  private func addSubviews() {
    addSubview(logoImageView)
    addSubview(userTextField)
    addSubview(passwordTextField)
    addSubview(button)
  }

  private func addConstraints() {
    constrain(self, logoImageView, userTextField, passwordTextField, button) { view, logo, user, password, button in
      if #available(iOS 11.0, *) {
        logo.top == view.safeAreaLayoutGuide.top + 56
      } else {
        logo.top == view.top + 56
      }
      logo.centerX == view.centerX

      user.top == logo.bottom + 100
      user.left == view.left + 16
      user.right == view.right - 16
      user.height == 50

      password.top == user.bottom + 20
      password.left == user.left
      password.right == user.right
      password.height == 50

      button.centerX == view.centerX
      if #available(iOS 11.0, *) {
        button.bottom == view.safeAreaLayoutGuide.bottom - 32
      } else {
        button.bottom == view.bottom - 32
      }
      button.width == 200
      button.height == 50
    }
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    endEditing(true)
  }
}

// MARK: - Actions
@objc
extension LoginView {
  func buttonTapped() {
    let fields = Login.SubmitFields(user: userTextField.text, password: passwordTextField.text)
    viewLogic?.didTapSubmitLogin(fields: fields)
  }
}
