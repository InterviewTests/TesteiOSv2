//
//  HomeInteractor.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 20/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit
protocol StatementListBusinessLogic {
    func fetchStatements(userId:String)
}

class HomeInteractor: StatementListBusinessLogic {
   var presenter: StatementListPresentationLogic?
    
    func fetchStatements(userId:String) {
        StatementWorker.getStatements(userId: userId) { (statements, msgError) in
            if let messsage = msgError {
                let response = HomeModel.Response.init(statements:nil, isError:true, messageError:messsage)
                self.presenter?.presentStatements(response:response)
            } else {
                let response = HomeModel.Response.init(statements:statements, isError:false, messageError:nil)
                self.presenter?.presentStatements(response:response)
            }
        }
    }
}

