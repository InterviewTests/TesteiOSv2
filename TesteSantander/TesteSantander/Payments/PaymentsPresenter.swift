//
//  PaymentsPresenter.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 27/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit

protocol PaymentsPresenterProtocol {
    
    var controller: PaymentsStatusProtocol? {get set}
    func updateTransactionList(_ transactionList:[Transaction])
    func transactionFailure(_ message:String)
}

class PaymentsPresenter: NSObject, PaymentsPresenterProtocol {
    var controller: PaymentsStatusProtocol?
    
    func updateTransactionList(_ transactionList: [Transaction]) {
        self.controller?.paymentsResponseSuccess(transactionList)
    }
    
    func transactionFailure(_ message:String) {
        self.controller?.paymentsResponseFailure(message)
    }

    
    
}
