//
//  LoginRouter.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 26/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit

protocol LoginRouterProtocol {
    func callPaymentsViewController(_ userAccount:Account, controller:UIViewController)
}

class LoginRouter: NSObject, LoginRouterProtocol {
    
    func callPaymentsViewController(_ userAccount: Account, controller: UIViewController) {
        let paymentController : PaymentsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PaymentsViewController") as! PaymentsViewController
        paymentController.userAccount = userAccount
        controller.present(paymentController, animated: true, completion: nil)
        //controller.performSegue(withIdentifier: "callPayments", sender: controller)
    }
}

extension LoginViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "callPayments" ,
//            let nextScene = segue.destination as? PaymentsViewController
//            nextScene?.userAccount =
//        }
    }
    
}
