//
//  LoginViewController.swift
//  Teste Santander
//
//  Created by VM on 23/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    var presenter: ViewToLoginPresenterProtocol?
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.logoButtonImage)
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let field = UITextField()
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.lightGray.cgColor
        return field
    }()
    
    lazy var passwordTextfield: UITextField = {
        let field = UITextField()
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.lightGray.cgColor
        return field
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.loginButtonTitle, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = Colors.loginButtonColor
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }

}

extension LoginViewController: PresenterToLoginViewProtocol, LayoutProtocol {
    
    func setUpLayout() {
        addSubviews()
        makeConstraints()
        setUpNavigationBar()
    }
    
    func addSubviews() {
        view.addSubview(logoImageView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextfield)
        view.addSubview(loginButton)
    }
    
    func makeConstraints() {
        logoImageView.snp.makeConstraints { (maker) in
            if #available(iOS 11.0, *) {
                maker.top.equalTo(view.safeAreaLayoutGuide).offset(35)
            } else {
                maker.top.equalToSuperview().offset(35)
            }
            
            maker.centerX.equalToSuperview()
            maker.width.equalTo(125)
            maker.height.equalTo(75)
            
        }
        
        emailTextField.snp.makeConstraints { (maker) in
            maker.width.equalToSuperview().inset(16)
            maker.centerX.centerY.equalToSuperview()
            maker.height.equalTo(50)
        }
        
        passwordTextfield.snp.makeConstraints { (maker) in
            maker.top.equalTo(emailTextField.snp.bottom).offset(21)
            maker.width.equalToSuperview().inset(16)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(202)
            maker.height.equalTo(62)
            if #available(iOS 11.0, *) {
                maker.bottom.equalTo(view.safeAreaLayoutGuide).offset(-33)
            } else {
                maker.bottom.equalToSuperview().offset(33)
            }
        }
    }
    
    func setUpNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}
