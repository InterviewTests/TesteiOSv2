//
//  StatementsViewController.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright (c) 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit

protocol StatementsDisplayLogic: class {
    func displayUser(viewModel: Statements.ViewModel)
    func displayStatements(viewModel: Statements.ViewModel)
    func displayStatementsError(viewModel: Statements.ViewModel)
    func displayGetOut(viewModel: Statements.ViewModel)
}

class StatementsViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: StatementsBusinessLogic?
    var router: (NSObjectProtocol & StatementsRoutingLogic & StatementsDataPassing)?
    var userLogin: UserLogin!
    var headerView: StatementsTableViewHeader!
    var displayedStatements: [Statement] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
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
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        startProgress()
        initTableView()
        interactor?.getUserLogin(request: Statements.Request())
    }
    
    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(StatementsTableViewCell.self)
        tableView.register(StatementsTableViewEmptyCell.self)
    }
    
    func setupHeader() {
        headerView = UIView.fromNib()
        tableView.tableHeaderView = headerView
        tableView.setHeightTableHeaderView(height: 222.0)
    }
}

extension StatementsViewController: StatementsDisplayLogic {
    func displayGetOut(viewModel: Statements.ViewModel) {
        router?.routeToGetOut()
    }
    
    func displayStatementsError(viewModel: Statements.ViewModel) {
        closeProgress()
        displayedStatements = []
        tableView.reloadData()
        AlertManager().showAlertController(body: viewModel.error?.message ?? "", title: "Error" , theme: .error)
    }
    
    func displayUser(viewModel: Statements.ViewModel) {
        userLogin = viewModel.userLogin
        headerView.nameLabel.text = userLogin.userAccount?.name
        headerView.balanceLabel.text = userLogin.userAccount?.balance.currencyFormat()
        headerView.accountLabel.text = "\(userLogin.userAccount?.bankAccount ?? "") / \(userLogin.userAccount?.agency ?? "")"
        headerView.closeButton.addTarget(self, action: #selector(touchedUpInsideButtonClose), for: .touchUpInside)
        interactor?.getStatementList(request: Statements.Request(userAccount: userLogin.userAccount))
    }
    
    @objc func touchedUpInsideButtonClose() {
        confirmationGetOut()
    }
    
    func displayStatements(viewModel: Statements.ViewModel) {
        displayedStatements = viewModel.statementList?.statementList ?? []
        tableView.reloadData()
        closeProgress()
    }
    
    func confirmationGetOut() {
        let alert = UIAlertController(title: "Bank", message: "Deseja realmente sair?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { action in
            self.interactor?.getOut(request: Statements.Request())
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
extension StatementsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedStatements.count > 0 ? displayedStatements.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if displayedStatements.isEmpty {
            return tableView.dequeueReusableCell(of: StatementsTableViewEmptyCell.self, for: indexPath) { (cell) in
            }
        } else {
            return tableView.dequeueReusableCell(of: StatementsTableViewCell.self, for: indexPath) { (cell) in
                cell.setupStatement(statement: self.displayedStatements[indexPath.row])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .white
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor(hex6: 0x777F8B)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return displayedStatements.count > 0 ? "Recentes" : nil
    }
    
}


public extension UITableView {
    func register(_ cell: UITableViewCell.Type) {
        let nib = UINib(nibName: cell.identifier, bundle: nil)
        register(nib, forCellReuseIdentifier: cell.identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(of class: T.Type,
                                                 for indexPath: IndexPath,
                                                 configure: @escaping ((T) -> Void) = { _ in }) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath)
        if let typedCell = cell as? T {
            configure(typedCell)
        }
        return cell
    }
    
    func setHeightTableHeaderView(height: CGFloat) {
        DispatchQueue.main.async { [weak self] in
            guard let headerView = self?.tableHeaderView else { return }
            var newFrame = headerView.frame
            newFrame.size.height = height
            
            UIView.animate(withDuration: 0.1) {
                self?.beginUpdates()
                headerView.frame = newFrame
                self?.endUpdates()
            }
        }
    }
}
