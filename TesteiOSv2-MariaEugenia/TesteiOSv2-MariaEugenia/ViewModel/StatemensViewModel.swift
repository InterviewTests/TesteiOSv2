//
//  StatemensViewModel.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 17/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import RxSwift
import RxCocoa
import RealmSwift


class StatemensViewModel {
    
    let container = try! Container()

    let statementsViewModel = BehaviorRelay<[StatementList]>(value: [])
    let userAccount = BehaviorRelay<UserAccountModel?>(value: nil)

    let isSuccess = BehaviorRelay<Bool>(value: false)
    let isLoading = BehaviorRelay<Bool>(value: false)
    let errorMsg = BehaviorRelay<String>(value:"")
    
    func fetchStatements() {
        
        TesteAPIManager.shared.getStatments(failure: { (error) in
            self.isLoading.accept(false)
            self.isSuccess.accept(false)
            self.errorMsg.accept(error ?? "Algo aconteceu. Tente novamente")
        }) { (statementsResult) in
             self.isLoading.accept(false)
            if let list = statementsResult?.statementList {
                self.isSuccess.accept(true)
                self.statementsViewModel.accept(list)
            } else if let errorMessage = statementsResult?.error?.message {
                self.isSuccess.accept(false)
                self.errorMsg.accept(errorMessage)
            }
        }
        
    }
    
    func queryUserAccount() {
        
        let results = container.values(UserAccountModel.self)
        if results.count > 0 {
            let account = UserAccountModel(managedObject: results.results.reversed()[0])
            userAccount.accept(account)
        }
    }
    
    func logoutUser() {
        try! container.write { transaction in
            if let user = userAccount.value {
                transaction.delete(user)
                self.isSuccess.accept(true)
            } else {
                self.errorMsg.accept("Problema no logout, tente novamente")
            }
        }
    }
    
}
