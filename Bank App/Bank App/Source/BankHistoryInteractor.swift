//
//  BankHistoryInteractor.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 24/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation
import UIKit

protocol BankHistoryInteractionLogic {
    
    func getStatementList(by userId: UserAccountable)
    func clearAutoLogin()
    func configureStatusBar()
    func configureStatusBarRelative(to y: CGFloat)
}

class BankHistoryInteractor: BankHistoryInteractionLogic, UserAccountData {
    
    var userAccount: UserAccountable?
    var presenter: BankHistoryPresentationLogic?
    
    func getStatementList(by user: UserAccountable) {
        guard let userId = user.userId else { return }
        
        BankWorker().statementList(by: userId) { (statementResponse) in
            if let bankError = statementResponse?.error, bankError.code != nil {
                self.presenter?.showError(error: bankError)
            }
            else if let statementList = statementResponse?.statementList {
                self.presenter?.displayStatements(statementList)
            }
        }
    }
    
    func clearAutoLogin() {
        KeychainWorker().deleteUser()
    }
    
    func configureStatusBar() {
        let hexColor = "#3B49EE".hexColor()
        presenter?.configureStatusBar(statusBarStyle: .lightContent, backgroudColor: hexColor)
    }
    
    func configureStatusBarRelative(to y: CGFloat) {
        if y > 216 - getSafeAreaInsets().top || y < (getSafeAreaInsets().top * -1) {
            presenter?.configureStatusBar(statusBarStyle: .default, backgroudColor: .white)
        }
        else {
            configureStatusBar()
        }
    }
}

extension BankHistoryInteractor {
    
    func getSafeAreaInsets() -> UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        else {
            return UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        }
    }
}
