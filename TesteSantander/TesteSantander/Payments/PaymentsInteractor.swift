//
//  PaymentsInteractor.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 26/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit

protocol PaymentsInteractorProtocol {
    var worker : PaymentWorkerProtocol? {get set}
    var presenter :PaymentsPresenterProtocol? {get set}
    func fetchAllTransactions(_ userID:Int)
}

class PaymentsInteractor: NSObject, PaymentsInteractorProtocol {
    
    var worker : PaymentWorkerProtocol?
    var presenter :PaymentsPresenterProtocol?
    
    func fetchAllTransactions(_ userID:Int) {
            self.worker?.fetchTransactionList(userID: userID, success: { (response) in
                self.presenter?.updateTransactionList(response.statementList)
            }, failure: { (error) in
                self.presenter?.transactionFailure(error.localizedDescription)
            })
        
    }

}
