//
//  StatementsViewController.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import UIKit

class StatementsViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var lb_userName: UILabel!
    @IBOutlet weak var lb_userAccount: UILabel!
    @IBOutlet weak var lb_userBalance: UILabel!
    @IBOutlet weak var tableView_statements: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Properties
    var interactor: StatementsInteractorProtocol?
    
    
    // MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StatementsRouter.createModule(view: self)
        delegates()
        setupView()
    }
    
    
    // MARK: - Setup View Methods
    
    private func delegates() {
        tableView_statements.delegate = self
        tableView_statements.dataSource = self
    }
    
    private func setupView() {
        interactor?.viewDidLoad()
    }
    
    
    // MARK: - UI Methods
    
    private func loading() {
        self.view.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
    }
    
    private func loaded() {
        activityIndicator.stopAnimating()
        self.view.isUserInteractionEnabled = true
    }
    
    
    // MARK: - Button Actions
    
    @IBAction func tapLogoutButton(_ sender: UIButton) {
        interactor?.logout()
    }

}

// MARK: - Presenter Delegate Methods

extension StatementsViewController: StatementsPresenterDelegate {
    
}


// MARK: - TableView Methods

extension StatementsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statementCell", for: indexPath) as! StatementTableViewCell
        
        return cell
    }
}
