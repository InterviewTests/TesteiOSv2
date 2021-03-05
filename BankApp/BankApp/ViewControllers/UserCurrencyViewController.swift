//
//  UserCurrencyViewController.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 04/03/21.
//

import UIKit
import Alamofire

class UserCurrencyViewController: UIViewController {
    @IBOutlet weak var testLabel: UILabel!
    var userAccount: UserAccount?
    var statements: [UserStatementViewModel]?
            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
                    
        fetchStatements()                
    }
    
    private func fetchStatements() {
        if let userId = userAccount?.userId {
            let url = "\(REQUESTS.STATEMENTS_ENDPOINT)\(userId)"
            
            let request = AF.request(url)
            
            request.responseDecodable(of: StatementsData.self) { response in
                if let statementList = response.value {
                    let statements = statementList.statementList
                    
                    DispatchQueue.main.async {
                        for statement in statements {
                            let userStatementViewModel = UserStatementViewModel(from: statement)
                            self.statements?.append(userStatementViewModel)
                        }
                    }
                }
            }
        }
    }
}
