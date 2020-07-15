//
//  ListCurrencyViewController.swift
//  BankAPP
//
//  Created by Alexandre Carlos Aun on 30/06/20.
//  Copyright © 2020 Alexandre Carlos Aun. All rights reserved.
//

import UIKit

class ListCurrencyViewController: UIViewController {
    
    let viewModel = CurrencyViewModel(apiManager: ApiManager())
    var statementList = [StatementList]()
    var dataUserLoged: DataUser?
    
    lazy var viewHeader: UIView = {
        let v = UIView()
        v.backgroundColor = .colorBlueBkg
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var labelUserName: UILabel = {
        let v = UILabel()
        v.textAlignment = .left
        v.textColor = .white
        v.text = "Jose da Silva Teste"
        v.font = UIFont().fontAppLight(size: 25)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var imageExit: UIImageView = {
        let v = UIImageView(image: UIImage(named: "logout"))
        v.contentMode = .scaleAspectFit
        let tgr = UITapGestureRecognizer(target: self, action: #selector(backToHome))
        tgr.numberOfTouchesRequired = 1
        tgr.numberOfTapsRequired = 1
        v.addGestureRecognizer(tgr)
        v.isUserInteractionEnabled = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var stackViewDataBank: UIStackView = {
        let v = UIStackView(arrangedSubviews: [labelTitleDataBank, labelDataBank])
        v.alignment = .fill
        v.spacing = 6
        v.distribution = .equalSpacing
        v.axis = .vertical
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var labelDataBank: UILabel = {
        let v = UILabel()
        v.textAlignment = .left
        v.textColor = .white
        v.text = "0000 / 01.000000-4"
        v.font = UIFont().fontAppLight(size: 25)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var labelTitleDataBank: UILabel = {
        let v = UILabel()
        v.textAlignment = .left
        v.textColor = .white
        v.text = "Conta"
        v.font = UIFont().fontAppDefault(size: 12)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var stackViewBalance: UIStackView = {
        let v = UIStackView(arrangedSubviews: [labelTitleBalance, labelBalance])
        v.alignment = .fill
        v.spacing = 6
        v.distribution = .equalSpacing
        v.axis = .vertical
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var labelBalance: UILabel = {
        let v = UILabel()
        v.textAlignment = .left
        v.textColor = .white
        v.text = "R$ 1.000,00"
        v.font = UIFont().fontAppLight(size: 25)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var labelTitleBalance: UILabel = {
        let v = UILabel()
        v.textAlignment = .left
        v.textColor = .white
        v.text = "Saldo"
        v.font = UIFont().fontAppDefault(size: 12)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var labelRecent: UILabel = {
        let v = UILabel()
        v.textAlignment = .left
        v.textColor = .colorDarkBlue
        v.text = "Recentes"
        v.font = UIFont().fontAppDefault(size: 17)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var tableview: UITableView = {
        let v = UITableView(frame: .zero)
        v.separatorStyle = .none
        v.allowsSelection = false
        //v.showsVerticalScrollIndicator = false
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        instantiateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
        tableview.reloadData()
    }
    
    private func instantiateUI() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(ListCurrencyTableViewCell.self, forCellReuseIdentifier: ListCurrencyTableViewCell.reuseIdentifier)

    }
    
    private func configureUI() {
        guard let userLogged = dataUserLoged else {
            labelUserName.text = "Pereira Pereira"
            labelBalance.text = String(2000.00)
            labelDataBank.text = "\(0000) / \(111111111)"
            return
        }
        
        labelUserName.text = userLogged.name
        labelBalance.text = "R$ \(userLogged.balance)"
        labelDataBank.text = "\(userLogged.agency) / \(userLogged.bankAccount)"
    }
    
    @objc func backToHome() {
        dismiss(animated: true, completion: nil)
    }
    
    private func setupUI() {
        view.backgroundColor = .colorWhiteBkg
        view.addSubview(viewHeader)
        viewHeader.addSubview(labelUserName)
        viewHeader.addSubview(imageExit)
        viewHeader.addSubview(stackViewDataBank)
        viewHeader.addSubview(stackViewBalance)
        view.addSubview(labelRecent)
        view.addSubview(tableview)
        
        var bottomanchor: NSLayoutYAxisAnchor
        
        if #available(iOS 11, *) {
            bottomanchor = view.safeAreaLayoutGuide.bottomAnchor
        }else{
            bottomanchor = view.bottomAnchor
        }
        
        NSLayoutConstraint.activate([
            viewHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            viewHeader.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            viewHeader.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            viewHeader.heightAnchor.constraint(equalToConstant: 232)
        ])
        NSLayoutConstraint.activate([
            labelUserName.topAnchor.constraint(equalTo: viewHeader.topAnchor, constant: 40),
            labelUserName.leftAnchor.constraint(equalTo: viewHeader.leftAnchor, constant: 18),
            labelUserName.rightAnchor.constraint(equalTo: viewHeader.rightAnchor, constant: -90),
            labelUserName.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            imageExit.centerYAnchor.constraint(equalTo: labelUserName.centerYAnchor, constant: 0),
            imageExit.rightAnchor.constraint(equalTo: viewHeader.rightAnchor, constant: -13),
            imageExit.widthAnchor.constraint(equalToConstant: 27),
            imageExit.heightAnchor.constraint(equalToConstant: 27)
        ])
        NSLayoutConstraint.activate([
            stackViewDataBank.topAnchor.constraint(equalTo: labelUserName.bottomAnchor, constant: 28),
            stackViewDataBank.leftAnchor.constraint(equalTo: viewHeader.leftAnchor, constant: 18),
            stackViewDataBank.rightAnchor.constraint(equalTo: viewHeader.rightAnchor, constant: -18),
            stackViewDataBank.heightAnchor.constraint(equalToConstant: 48)
        ])
        NSLayoutConstraint.activate([
            stackViewBalance.topAnchor.constraint(equalTo: stackViewDataBank.bottomAnchor, constant: 21),
            stackViewBalance.leftAnchor.constraint(equalTo: viewHeader.leftAnchor, constant: 18),
            stackViewBalance.rightAnchor.constraint(equalTo: viewHeader.rightAnchor, constant: -18),
            stackViewBalance.bottomAnchor.constraint(equalTo: viewHeader.bottomAnchor, constant: -17)
        ])
        
        NSLayoutConstraint.activate([
            labelRecent.topAnchor.constraint(equalTo: viewHeader.bottomAnchor, constant: 14),
            labelRecent.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 18),
            labelRecent.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            labelRecent.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: labelRecent.bottomAnchor, constant: 8),
            tableview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            tableview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            tableview.bottomAnchor.constraint(equalTo: bottomanchor, constant: 0)
        ])
    }
}

extension ListCurrencyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListCurrencyTableViewCell.reuseIdentifier, for: indexPath) as? ListCurrencyTableViewCell else {return UITableViewCell()}
        
        cell.frame.size.width = tableView.frame.size.width
        //        cell.contentView.layer.cornerRadius = 16
        //        cell.contentView.clipsToBounds = false
        //        cell.contentView.layer.borderColor = UIColor.colorBorder.cgColor
        //        cell.backgroundColor = .clear
        //        //cell.layer.shadowOffset = CGSize(width: 1, height: 0)
        //        cell.layer.shadowRadius = 4
        //        cell.layer.shadowOpacity = 0.20
        //        cell.layer.shadowOffset = .zero
        //        cell.layer.masksToBounds = false
        //        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        //        cell.layer.shouldRasterize = true
        //
        cell.backgroundColor = .clear
        cell.layer.shadowColor = UIColor.colorShadowCell.cgColor
        
        cell.layer.cornerRadius = 16
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.shadowRadius = 3
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale
        
        
        cell.statementsContent(infoStatement: statementList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    
    
    
    
    
    
    
    
    
}
