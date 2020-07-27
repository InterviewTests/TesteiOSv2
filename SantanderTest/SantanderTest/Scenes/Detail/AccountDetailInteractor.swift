//
//  AccountDetailInteractor.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 26/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

protocol AccountDetailBusinessLogic {
    func retrieveStaments()
    var height: CGFloat { get }
    func numberOfRows(in section: Int) -> Int
    func header(tableView: UITableView, section: Int) -> UIView
    func cell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}

protocol AccountDetailDataStore {
    var user: UserAccount? { get set }
}

class AccountDetailInteractor: AccountDetailBusinessLogic,AccountDetailDataStore {
    
    var user: UserAccount?
    
    var presenter: AccountDetailPresentationLogic?
    var worker: AccountDetailWorker
    
    var statments: [StatementList]
    
    var height: CGFloat {
        return 96.0
    }
    
    init(with worker: AccountDetailWorker = AccountDetailWorker()) {
        self.worker = worker
        statments = []
    }
    
    func retrieveStaments() {
        worker.retrieveStatments(for: 1).done(handleSuccess).catch(handleError)
    }
    
    //MARK: -
    //MARK: - HANDLE SUCCESS
    func handleSuccess(response: AccountDetail.Response) {
        presenter?.shouldPresentLoading(false)
        if let error = response.error?.message {
            presentError(with: error)
        } else {
            statments = response.statementList ?? []
            presenter?.presentData()
        }
    }
    
    //MARK: -
    //MARK: - HANDLE ERROR
    func handleError(error: Error) {
        presentError(with: error.localizedDescription)
    }
    
    //MARK: -
    //MARK: - SETUP PRESENT ERROR
    func presentError(with message: String) {
        presenter?.shouldPresentLoading(false)
        presenter?.onError(title: Strings.Error.alertTitle, message: message)
    }
    
    func numberOfRows(in section: Int) -> Int {
        if section == 1 {
            return statments.count
        }
        return 0
    }
    
    func header(tableView: UITableView, section: Int) -> UIView {
        if section == 1 {
            let rect = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 80)
            let sectionView = StatmentSectionView(frame: rect)
            sectionView.set(text: Strings.Statment.Section.sectionTitle)
            return sectionView
        }
        let rect = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 230)
        let headerView = StatmentHeaderView(frame: rect)
        let vm = AccountDetail.TableViewModel.Section(user: user)
        headerView.set(vm: vm, handler: logout)
        return headerView
    }
    
    func cell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(StatementCell.self)
            let statment = statments[indexPath.row]
            let vm = AccountDetail.TableViewModel.Cell(statment: statment)
            cell.set(vm: vm)
            return cell
        }
        return UITableViewCell()
    }
    
    func logout() {
        presenter?.performLogout()
    }
}
