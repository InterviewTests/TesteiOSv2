//
//  MainViewController.swift
//  Accenture iOS Test
//
//  Created by João Pedro Giarrante on 25/07/20.
//  Copyright © 2020 João Pedro Giarrante. All rights reserved.
//

import UIKit


class MainViewCell: UITableViewCell {
    @IBOutlet weak var viewShadow: UIView!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
}


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var lblBalance: UILabel!
    @IBOutlet weak var lblAccount: UILabel!
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var appDelegate: AppDelegate!
    var bankTransactions: [BankTransaction] = []
    var userAccount: UserAccount?
    let apiCaller = APICaller()

    let cellIdentifier = "cell"
    let cellHeight = 110
    let segueLogout = "logout"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        // Populating Fields
        self.lblUser.text = userAccount?.name
        self.lblBalance.text = String.FormatReal(userAccount?.balance?.floatValue ?? 0)
        self.lblAccount.text = "\(userAccount?.agency ?? "") / \(String.FormatAccountNumber(userAccount!.bankAccount ?? ""))"
        
        // Method that calls API
        getUserTransactions()
    }
    
    
    // MARK: - Override
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    
    // MARK: - Functions
    
    func getUserTransactions() {
        activityIndicator.startAnimating()
        apiCaller.getUserTransactions(user: userAccount?.userId ?? 0, delegate: self)
    }
    
    
    // MARK: - Actions
    
    @IBAction func clickLogout(_ sender: UIButton) {
        self.performSegue(withIdentifier: segueLogout, sender: self)
    }
    
    
    // MARK: - Delegates
    
    func getUserTransactionsResponse(response: [NSDictionary]){
        activityIndicator.stopAnimating()
        if(response.count > 0){
            
            // Populate BankTransaction's Array
            for dic in response {
                let title = dic["title"] as? String ?? ""
                let description = dic["desc"] as? String ?? ""
                let date = dic["date"] as? String ?? ""
                let value = dic["value"] as? NSNumber ?? 0
                bankTransactions.append(BankTransaction(date: date, description: description, title: title, value: value))
            }
            
            // Set TableView's DataSource & reload it
            self.tableview.delegate = self
            self.tableview.dataSource = self
            self.tableview.reloadData()
            
        } else {
            print("getUserTransactionsResponse: response.count = " + String(response.count))
            getUserTransactionsError(error: nil);
        }
    }
        
    func getUserTransactionsError(error: NSDictionary?){
        activityIndicator.stopAnimating()
        var alertMessage = "defaultBodyMessageError".localized
        if(error?["message"] != nil){
            alertMessage = error?["message"] as! String
        }
        let alert = UIAlertController(title: "Atenção", message: alertMessage, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: true)
        
    }
    
    
    // MARK: - TableView Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return bankTransactions.count
    }
    
    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: cellIdentifier) as! MainViewCell
        
        // Formatting Cell Layout:
        UIView.LayoutRoundedWithShadow(view: cell.viewContent, shadowColor: App.Color.greyThemeLight, borderColor: App.Color.greyThemeBorder)

        // Populating Cell:
        cell.lblTitle.text = bankTransactions[indexPath[0]].title ?? ""
        cell.lblDescription.text = bankTransactions[indexPath[0]].description ?? ""
        cell.lblValue.text = String.FormatReal(bankTransactions[indexPath[0]].value?.floatValue ?? 0)
        cell.lblDate.text = bankTransactions[indexPath[0]].date?.toDate(format: "yyy-MM-dd").toString(format: "dd/MM/yyyy") ?? ""
        
        return cell
    }
    
    // Height of cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellHeight)
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // note that indexPath.section is used rather than indexPath.row
        print("You tapped cell number \(indexPath.section).")
    }
    

}
