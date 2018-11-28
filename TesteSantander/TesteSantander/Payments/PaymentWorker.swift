//
//  PaymentWorker.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 26/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit
import Alamofire



protocol PaymentWorkerProtocol {
    func fetchTransactionList(userID:Int, success:@escaping (ResponseTransactions) -> Void, failure:@escaping (Error) -> Void)
}

class PaymentWorker: NSObject, PaymentWorkerProtocol {

    func fetchTransactionList(userID:Int, success:@escaping (ResponseTransactions) -> Void, failure:@escaping (Error) -> Void) {
        
        let url = "https://bank-app-test.herokuapp.com/api/statements/\(userID)"
        
        Alamofire.request(url).validate().responseData { (response) in
            switch response.result {
                case .success:
                    let decoder = JSONDecoder()
                    let parseResponse: Result<ResponseTransactions> = decoder.decodeResponse(from: response)
                    if var value = parseResponse.value {
                        success(value)
                        return
                    }
                    failure(GeneralError.serviceConnection)
                case .failure(let Error):
                    failure(GeneralError.serviceConnection)
            }
        }
        
    }
    
}
