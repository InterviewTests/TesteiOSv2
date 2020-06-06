//
//  LoginViewController.swift
//  UserInterface
//
//  Created by Estaife Lima on 05/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import UIKit

public class LoginViewController: CustomViewController {
    
    // MARK: - PUBLIC PROPERTIES
    
    public var isLoading: Bool {
        return indicatorView.isAnimating
    }
    
    // MARK: - CONSTANTS
    
    private struct Strings {
        static let placeholderUser = "Insert your CPF or e-mail..."
        static let placeholderPassword = "Insert your Password..."
        static let login = "Login"
    }
    
    private struct Metrics {
        static let margin: CGFloat = 16
        static let loginButtonMultiplier: CGFloat = 0.3
        static let loginButtonCornerRadius: CGFloat = 4
        static let borderWidth: CGFloat = 1
        static let heightElements: CGFloat = 50
    }
    
    // MARK: - UI
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView() //TODO: - Add a image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var credentialsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = Metrics.margin
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var userTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Strings.placeholderUser
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textContentType = .nickname
        textField.textAlignment = .center
        textField.layer.cornerRadius = Metrics.loginButtonCornerRadius
        textField.layer.borderWidth = Metrics.borderWidth
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Strings.placeholderPassword
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textContentType = .nickname
        textField.textAlignment = .center
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = Metrics.loginButtonCornerRadius
        textField.layer.borderWidth = Metrics.borderWidth
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Strings.login, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .init(red: 0.23, green: 0.20, blue: 0.93, alpha: 1.0)
        button.layer.cornerRadius = Metrics.loginButtonCornerRadius
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.hidesWhenStopped = true
        return indicatorView
    }()
    
    // MARK: - INITALIZER
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFE CYCLE
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - TOUCHES
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(false)
    }
    
    // MARK: - VIEW HIERARCHY
    
    public func subviews() {
        view.addSubview(indicatorView)
        view.addSubview(logoImageView)
        view.addSubview(credentialsStackView)
        credentialsStackView.addArrangedSubview(userTextField)
        credentialsStackView.addArrangedSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    public func constraints() {
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            logoImageView.bottomAnchor.constraint(equalTo: credentialsStackView.topAnchor, constant: -Metrics.margin * 4),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            credentialsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin),
            credentialsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.margin),
            credentialsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            userTextField.heightAnchor.constraint(equalToConstant: Metrics.heightElements),
            userTextField.leadingAnchor.constraint(equalTo: credentialsStackView.leadingAnchor),
            userTextField.trailingAnchor.constraint(equalTo: credentialsStackView.trailingAnchor),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.heightElements),
            passwordTextField.leadingAnchor.constraint(equalTo: credentialsStackView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: credentialsStackView.trailingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: credentialsStackView.bottomAnchor, constant: Metrics.margin * 9),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin * 6),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.margin * 6),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.heightElements),
        ])
    }
    
    public func style() {
        view.backgroundColor = .white
    }
    
    // MARK: - PRIVATE FUNC
    
    @objc
    private func didTapLogin() {
        
    }
   
}

