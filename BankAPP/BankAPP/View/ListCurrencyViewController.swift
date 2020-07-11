//
//  ListCurrencyViewController.swift
//  BankAPP
//
//  Created by Alexandre Carlos Aun on 30/06/20.
//  Copyright © 2020 Alexandre Carlos Aun. All rights reserved.
//

import UIKit

class ListCurrencyViewController: UIViewController {
    
    lazy var viewHeader: UIView = {
        let v = UIView()
        v.backgroundColor = .colorBlue
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
        let v = UIImageView(image: UIImage(named: ""))
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
        v.textColor = .colorGray
        v.text = "Recentes"
        v.font = UIFont().fontAppDefault(size: 17)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var tableview: UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        setupUI()
        instantiateUI()
    }
    
    private func instantiateUI() {
        tableview.delegate = self
        tableview.dataSource = self
       // tableview.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
    }
    
    private func setupUI() {
        view.backgroundColor = .colorWhite
        view.addSubview(viewHeader)
        viewHeader.addSubview(labelUserName)
        viewHeader.addSubview(imageExit)
        viewHeader.addSubview(labelDataBank)
        viewHeader.addSubview(labelTitleDataBank)
        viewHeader.addSubview(labelBalance)
        viewHeader.addSubview(labelTitleBalance)
        view.addSubview(labelRecent)
        view.addSubview(tableview)

        var topanchor: NSLayoutYAxisAnchor
        var bottomanchor: NSLayoutYAxisAnchor
        
        if #available(iOS 11, *) {
            topanchor = view.safeAreaLayoutGuide.topAnchor
            bottomanchor = view.safeAreaLayoutGuide.bottomAnchor
        }else{
            topanchor = view.topAnchor
            bottomanchor = view.bottomAnchor
        }
        
        NSLayoutConstraint.activate([
            viewHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            viewHeader.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            viewHeader.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            viewHeader.heightAnchor.constraint(equalToConstant: 232)
        ])
        



        
        
    }
    
}

extension ListCurrencyViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
    
    
    
    
    
    
    
}
