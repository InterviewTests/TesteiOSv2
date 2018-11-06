//
//  CurrencyViewController.swift
//  BankSantanderTata
//
//  Created on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import UIKit
import ObjectMapper

final class CurrencyViewController: UIViewController {
    
    @IBOutlet private weak var labelName: UILabel!
    @IBOutlet private weak var labelBalanceAccount: UILabel!
    @IBOutlet private weak var labelAgency: UILabel!
    @IBOutlet private weak var labelBalance: UILabel!
    
    @IBOutlet private weak var tableview: UITableView!
    
    var presenter: CurrencyPresenterProtocol!
    var data: UserAccount!
    
    private var statementList = [Statement]()
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAccessibilityIdentifiers()
        setupLabels()
        applyStyle()
        navigationController?.setNavigationBarHidden(true, animated: true)
        getData()
    }
    
    
    
    // MARK: - Setup Methods
    private func setupAccessibilityIdentifiers() {
        
    }
    
    private func setupLabels() {
        labelName.text = data.name
        
    }
    
    private func applyStyle() {
        
    }
    
    @IBAction func logout(_ sender: Any) {
        presenter.logout()
    }
    
    func getData(){
        
        ApiService.sharedInstance.statement() { response in
            switch response.result{
            case .success:
                let data = response.result.value as! [String: Any]
                let trans = data["statementList"] as! [[String:Any]]
                self.statementList = Mapper<Statement>().mapArray(JSONArray: trans)
                
                self.tableview.reloadData()
                break
            case .failure(let error):
                debugPrint(error)
                break
            }
        }
    }
    
    
}

// MARK: - CurrencyViewProtocol
extension CurrencyViewController: CurrencyViewProtocol {
    
}

// MARK: - CurrencyViewDelegate
extension CurrencyViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CurrencyTableViewCell = tableview.dequeueReusableCell(withIdentifier: "cell") as! CurrencyTableViewCell
        
        cell.setup(statement: statementList[indexPath.row])

        return cell
    }
    
    
}
