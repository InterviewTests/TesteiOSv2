//
//  ExtratoViewController.swift
//  BankApp
//
//  Created by Victor Lisboa on 20/09/19.
//  Copyright (c) 2019 Victor Lisboa. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ExtratoDisplayLogic: class
{
    func displayStatementList(responseExtrato: Extrato.Something.Response)
}

class ExtratoViewController: UIViewController, ExtratoDisplayLogic
{
    
    var interactor: ExtratoBusinessLogic?
    var router: (NSObjectProtocol & ExtratoRoutingLogic & ExtratoDataPassing)?
    var statementList: [Extrato.Something.Statement]?
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
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
        let interactor = ExtratoInteractor()
        let presenter = ExtratoPresenter()
        let router = ExtratoRouter()
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
        
        if let userAccount = router?.dataStore?.userAccount {
            nomeLabel.text = userAccount.name ?? ""
            contaLabel.text = "\(userAccount.bankAccount ?? "") / \(userAccount.agency?.separarDigito() ?? "")"
            let saldo = userAccount.balance ?? 0.0
            if saldo < 0.0 {
                saldoLabel.textColor = .orange
            }
            saldoLabel.text = saldo.formataMoeda()
        }
        
        doExtrato()
        
        extratoTableView.register(UINib(nibName: "ExtratoCell", bundle: nil), forCellReuseIdentifier: "ExtratoCell")
        
    }
    // MARK: Do something
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var contaLabel: UILabel!
    @IBOutlet weak var saldoLabel: UILabel!
    @IBOutlet weak var extratoTableView: UITableView!
    
    func doExtrato()
    {
        let request = Extrato.Something.Request()
        interactor?.doExtrato(request: request)
    }
    
    func displayStatementList(responseExtrato: Extrato.Something.Response)
    {
        statementList = responseExtrato.statementList
        extratoTableView.reloadData()
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ExtratoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statementList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recentes"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = extratoTableView.dequeueReusableCell(withIdentifier: "ExtratoCell", for: indexPath) as! ExtratoTableViewCell
        
        
        cell.titleLabel.text = statementList?[indexPath.row].title ?? ""
        
        let date = statementList?[indexPath.row].date ?? ""
        cell.dateLabel.text = date.formataData()
        
        cell.descLabel.text = statementList?[indexPath.row].desc ?? ""
        
        let value = statementList?[indexPath.row].value ?? 0.0
        
        if value < 0 {
            cell.valueLabel.textColor = .red
        }
        cell.valueLabel.text = value.formataMoeda()
        
        return cell
    }    
}
