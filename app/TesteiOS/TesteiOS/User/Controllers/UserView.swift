//
//  UserView.swift
//  TesteiOS
//
//  Created by Douugr on 14/01/2019.
//  Copyright © 2019 doug. All rights reserved.
//

import UIKit

protocol UserViewDelegate {
    func logout()
}

class UserView: UIView {
    
    @IBOutlet private var userView: UIView!
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "UserTableViewCell")
            tableView.dataSource = self
        }
    }
    
    
    @IBOutlet private weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = User.name
        }
    }
    @IBOutlet private weak var accountLabel: UILabel! {
        didSet {
            accountLabel.text = "\(User.agency ?? "") / \(User.bankAccount ?? "")"
        }
    }
    @IBOutlet private weak var amountLabel: UILabel! {
        didSet {
            amountLabel.text = "R$ \(User.balance ?? 0.00)".replacingOccurrences(of: ".", with: ",")
        }
    }

    
    
    
    var delegate: UserViewDelegate?
    
    var userProvider = UserProvider()
    var statements: [StatementObject]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        userProvider.delegate = self
        Bundle.main.loadNibNamed("UserView", owner: self, options: nil)
        addSubview(self.userView)
        self.userView.frame = self.bounds
        self.userView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        userProvider.getStatements(userId: User.userId)
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        delegate?.logout()
    }
    
}

extension UserView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = statements?.count ?? 0
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell {
            if let statement: StatementObject = statements?[indexPath.row] {
                cell.statementDate = statement.date.replacingOccurrences(of: "-", with: "/")
                cell.statementName = statement.desc
                cell.statementType = statement.title
                cell.statementValue = "R$ \(String(statement.value ?? 0.0).replacingOccurrences(of: ".", with: ","))"
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
}

extension UserView: UserProviderDelegate {
    func success(statements: [StatementObject]) {
        self.statements = statements
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error)
    }
    
}
