//
//  HomeViewController.swift
//  santander-interview
//
//  Created by Hugo Ferreira on 16/05/20.
//  Copyright © 2020 Hugo Ferreira. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var labelClientName: UILabel!
    @IBOutlet weak var labelbankAccount: UILabel!
    @IBOutlet weak var labelBalance: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    
    
    var userModel : UserModel?
    var statement : [StatementModel]?
    let homeBrainModel = HomeBrainModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        containerView.backgroundColor = #colorLiteral(red: 0.99598068, green: 0.9961469769, blue: 0.9959587455, alpha: 1)
        containerView.layer.masksToBounds = true
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DetailsCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        setUserInfo()
        homeBrainModel.requestStatement(userModel!.userId!, completionSuccess: {
            response in self.statement = response
            self.tableView.reloadData()

            
        }, completionError: {
            error in print(error)
            return
        } )
        
    }

    @IBAction func logoutPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setUserInfo(){
        labelClientName.text = userModel!.name
        labelbankAccount.text = "\(userModel!.bankAccount!) /  \(userModel!.agency!)"
        labelBalance.text = "R$ \(String(format: "%.2f", Float((userModel!.balance)!)))"
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statement?.count ?? 0
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! DetailsCell
        
        cell.titleLabel.text = statement![indexPath.row].title ?? ""
        cell.dateLabel.text = statement![indexPath.row].date ?? ""
        cell.descLabel.text = statement![indexPath.row].desc ?? ""
        cell.valueLabel.text = "R$ \(String(format: "%.2f", statement![indexPath.row].value ?? 0))"
        
        return cell
        
    }
        
}

