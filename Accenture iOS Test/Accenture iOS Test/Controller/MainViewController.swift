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
    
    var bankTransactions: [BankTransaction] = []
    var userAccount: UserAccount?
    let apiCaller = APICaller()

    var appDelegate: AppDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        

        // R$ Formatter:
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "pt_BR")
        
        // Format Account Number
        var maskedAccount: String?
        if(userAccount?.bankAccount != nil){
            let account = userAccount!.bankAccount!

            let firstIndex = account.index(account.startIndex, offsetBy: 0)..<account.index(account.startIndex, offsetBy: 2)
            let secondIndex = account.index(account.startIndex, offsetBy: 2)..<account.index(account.startIndex, offsetBy: 8)
            let thirdIndex = account.index(account.startIndex, offsetBy: 8)..<account.endIndex
            maskedAccount = "\(account[firstIndex]).\(account[secondIndex])-\(account[thirdIndex])"
        }
        
        // Populating Fields
        self.lblUser.text = userAccount?.name
        self.lblBalance.text = currencyFormatter.string(from: userAccount?.balance ?? 0)
        if(userAccount?.agency != nil && maskedAccount != nil){
           self.lblAccount.text = "\(userAccount!.agency!) / \(maskedAccount!)"
        }
        
        getUserTransactions()
    }
    
    func getUserTransactions() {
        
        activityIndicator.startAnimating()
        apiCaller.getUserTransactions(user: userAccount?.userId ?? 0, delegate: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    @IBAction func clickLogout(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Delegates
    func getUserTransactionsResponse(response: [NSDictionary]){
        activityIndicator.stopAnimating()
        if(response.count > 0){
            var bkTransaction = BankTransaction()
            for dic in response {
                bkTransaction.title = dic["title"] as? String
                bkTransaction.description = dic["desc"] as? String
                bkTransaction.date = dic["date"] as? String
                bkTransaction.value = dic["value"] as? NSNumber
                bankTransactions.append(bkTransaction)
            }
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
        var alertMessage = "Ocorreu um erro. Tente novamente mais tarde."
        if(error?["message"] != nil){
            alertMessage = error?["message"] as! String
        }
        let alert = UIAlertController(title: "Atenção", message: alertMessage, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: true)
        
    }
    
    // MARK: - Table View delegate methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return bankTransactions.count
    }
    
    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell") as! MainViewCell
        
        // Formatting Cell:
        cell.viewContent.layer.borderColor = #colorLiteral(red: 0.8588235294, green: 0.8745098039, blue: 0.8901960784, alpha: 0.3)
        cell.viewContent.layer.borderWidth = 1
        cell.viewContent.layer.cornerRadius = 6
        cell.viewContent.layer.masksToBounds = true
        cell.viewShadow.layer.masksToBounds = false
        cell.viewShadow.layer.shadowOffset = CGSize(width: 0, height: 4)
        cell.viewShadow.layer.shadowColor = #colorLiteral(red: 0.8588235294, green: 0.8705882353, blue: 0.8862745098, alpha: 1)
        cell.viewShadow.layer.shadowOpacity = 0.3
        cell.viewShadow.layer.shadowRadius = 12
        
        
        // R$ Formatter:
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "pt_BR")
        
        // Populating Cell:
        cell.lblTitle.text = bankTransactions[indexPath[0]].title!
        cell.lblDescription.text = bankTransactions[indexPath[0]].description!
        cell.lblValue.text = currencyFormatter.string(from: NSNumber(value: bankTransactions[indexPath[0]].value!.floatValue))!
        cell.lblDate.text = bankTransactions[indexPath[0]].date!
        
        return cell
    }
    
    // Height of cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // note that indexPath.section is used rather than indexPath.row
        print("You tapped cell number \(indexPath.section).")
    }
    

}
