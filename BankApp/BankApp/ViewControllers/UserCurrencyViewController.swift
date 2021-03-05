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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
                
        if let userId = userAccount?.userId {
            let url = "\(REQUESTS.STATEMENTS_ENDPOINT)\(userId)"
                    
            let request = AF.request(url)
                    
            request.responseJSON { data in
                print(data.debugDescription)
            }
            

        }
    }
}
