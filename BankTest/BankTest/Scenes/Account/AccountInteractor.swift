//
//  AccountInteractor.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright (c) 2020 bank. All rights reserved.

import UIKit

protocol AccountBusinessLogic {

    func statements(login: Login.Response)
}

protocol AccountDataStore {
    var statements: [Statement] { get set }
}

class AccountInteractor: AccountBusinessLogic, AccountDataStore {

    var statements: [Statement] = []
    var presenter: AccountPresentationLogic?
    var worker: AccountWorker?

    init(worker: AccountWorker = AccountWorker()) {
        self.worker = worker
    }

    func statements(login: Login.Response) {
        let request = Account.Request(accountId: login.userAccount.userId)
        worker?.statements(request: request, success: { [weak self] (response) in
            self?.statements = response.statementList
            self?.presenter?.showStatements()
        }, failure: { (error) in

        })
    }
}
