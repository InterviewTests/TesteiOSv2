//
//  StatementHeaderView.swift
//  BankApp-Desafio
//
//  Created by Mizia Lima on 2/26/21.
//

import UIKit

class StatementHeaderView: UIView {
    
    private var user: User?
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Nome do Usuário"
        label.font = UIFont(name: "Helvetica Neue", size: 25.0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var agencyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Conta"
        label.font = UIFont(name: "Helvetica Neue", size: 12.0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var agencyAccount: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Conta do Usuário"
        label.font = UIFont(name: "Helvetica Neue", size: 25.0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Saldo"
        label.font = UIFont(name: "Helvetica Neue", size: 12.0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var balanceValue: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Saldo"
        label.font = UIFont(name: "Helvetica Neue", size: 25.0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var logoutImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logout 2"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        self.configureView()
        setupViewHierarchy()
        setupConstraints()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(){
        self.backgroundColor = .mediumBlue()
        self.layer.shouldRasterize = true
    }
    
    func setupViewHierarchy() {
        addSubview(usernameLabel)
        addSubview(agencyLabel)
        addSubview(agencyAccount)
        addSubview(balanceLabel)
        addSubview(balanceValue)
        addSubview(logoutImageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoutImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -13),
            logoutImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            logoutImageView.heightAnchor.constraint(equalToConstant: 27),
            logoutImageView.widthAnchor.constraint(equalToConstant: 27),
            
            usernameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            usernameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            usernameLabel.trailingAnchor.constraint(equalTo: logoutImageView.leadingAnchor, constant: -102),
            
            agencyLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 28),
            agencyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            
            agencyAccount.topAnchor.constraint(equalTo: agencyLabel.bottomAnchor, constant: 7),
            agencyAccount.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            
            balanceLabel.topAnchor.constraint(equalTo: agencyAccount.bottomAnchor, constant: 21),
            balanceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            
            balanceValue.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 7),
            balanceValue.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
        ])
        
    }
}
