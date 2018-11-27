//
//  PaymentsViewController.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 26/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit

protocol PaymentsStatusProtocol {
    func paymentsResponseSuccess(_ transactionsList:[Transaction])
    func paymentsResponseFailure(_ message:String)
}

class PaymentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PaymentsStatusProtocol {

    var userAccount : Account?
    var router : PaymentsRouterProtocol?
    var interactor : PaymentsInteractorProtocol?
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var errorView : UIView!
    var transactionsList : [Transaction] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let nib = UINib(nibName: "PaymentTableViewCell", bundle: Bundle(for: PaymentTableViewCell.self))
        self.tableView.register(nib, forCellReuseIdentifier: "PaymentTableViewCell")
        self.setupScene()
        
        self.fetchTransactions()
        
    }
    
    func fetchTransactions()  {
        if let userID = self.userAccount?.userId {
            LoadinView.start()
            self.interactor?.fetchAllTransactions(userID)
        }
    }
    
    override func viewDidLayoutSubviews() {
        if let account = self.userAccount {
            let tableHeader : PaymentTableHeader = PaymentTableHeader().loadViewFromNib({
                self.router?.logout(self)
            },userAccount: account) //PaymentTableHeader().loadViewFromNib() as! PaymentTableHeader
            self.tableView.tableHeaderView = tableHeader
        }
        
    }
    
    func setupScene() {
        self.router = PaymentsRouter()
        self.interactor = PaymentsInteractor()
        self.interactor?.worker = PaymentWorker()
        self.interactor?.presenter = PaymentsPresenter()
        self.interactor?.presenter?.controller = self
    }
    
    @IBAction func tryAgainRequest(_ sender: Any) {
        self.fetchTransactions()
    }
    
    
    // PAYMENTS STATUS PROTOCOL
    
    func paymentsResponseSuccess(_ transactionsList:[Transaction]) {
        self.transactionsList = transactionsList
        LoadinView.stop()
        self.errorView.isHidden = true
    }
    func paymentsResponseFailure(_ message:String) {
        self.errorView.isHidden = false
        LoadinView.stop()
    }
    
    
    // TABLEVIEW DATA SOURCE AND DELEGATE
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentTableViewCell", for: indexPath) as! PaymentTableViewCell
        cell.setTransaction(self.transactionsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactionsList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return RecentSectionView().loadViewFromNib()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 47
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
