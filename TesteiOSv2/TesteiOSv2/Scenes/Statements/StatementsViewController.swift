//
//  StatementsViewController.swift
//  TesteiOSv2
//
//  Created by Jose Neves on 11/01/19.
//  Copyright © 2019 joseneves. All rights reserved.
//

import UIKit

protocol StatementsDisplayLogic: class {
    func showStatements(viewModel: Statements.GetStatements.ViewModel)
}

class StatementsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, StatementsDisplayLogic {
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var statementsTableView: UITableView!
    
    var interactor: StatementsBusinessLogic?
    var router: (NSObjectProtocol)?
    var user: User?
    var statements: [Statement]?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.statementsTableView.register(UINib(nibName: "StatementTableCell", bundle: nil), forCellReuseIdentifier: "statementTableCell")
        self.statementsTableView.delegate = self
        self.statementsTableView.dataSource = self
        
        self.userLabel.text = self.user?.name
        self.accountLabel.text = "\(self.user?.bankAccount ?? "") / \(self.user?.agency ?? "")"
        self.balanceLabel.text = "R$\(self.user?.balance ?? 0)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getStatements()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.statements?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let statement = self.statements?[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "statementTableCell", for: indexPath) as! StatementTableViewCell
        cell.titleLabel.text = statement?.title
        cell.descLabel.text = statement?.desc
        cell.dateLabel.text = statement?.date
        cell.valueLabel.text = "R$\(statement?.value ?? 0)"
        
        return cell
    }
    
    func setUser(user: User) {
        self.user = user
    }
    
    func getStatements() {
        let request = Statements.GetStatements.Request()
        self.interactor?.getStatements(request: request)
    }
    
    func showStatements(viewModel: Statements.GetStatements.ViewModel) {
        self.statements = viewModel.statements
        self.statementsTableView.reloadData()
    }
    
    private func setup() {
        let viewController = self
        let interactor = StatementsInteractor()
        let presenter = StatementsPresenter()
        let router = StatementsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
}
