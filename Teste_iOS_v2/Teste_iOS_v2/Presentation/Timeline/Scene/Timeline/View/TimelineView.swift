//
//  TimelineView.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 03/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

class TimelineView: UIView, NibLoadable {
    
    @IBOutlet private(set) weak var userInformationsView: UIView!
    @IBOutlet private(set) weak var userName: UILabel!
    @IBOutlet private(set) weak var logoutImageView: UIImageView!
    
    @IBOutlet private(set) weak var accountView: UIView!
    @IBOutlet private(set) weak var accountLabel: UILabel!
    @IBOutlet private(set) weak var accountNumber: UILabel!
    
    @IBOutlet private(set) weak var balanceView: UIView!
    @IBOutlet private(set) weak var balanceLabel: UILabel!
    @IBOutlet private(set) weak var balanceNumber: UILabel!
    
    @IBOutlet private(set) weak var transactionView: UIView!
    @IBOutlet private(set) weak var transactionTableView: UITableView!
    
    private let identifier = "TransactionCell"
    private var viewModel = TimelineViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }
    
    private func commomInit() {
        setupFromNib()
        setupTableView()
    }
    
    private func setupTableView() {
        transactionTableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
    }
    
    func addTransactionList(list: [TimelineModel]) {
        viewModel.refreshList(list)
        transactionTableView.reloadData()
    }
}

extension TimelineView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.rowHeight()
    }
}

extension TimelineView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TransactionCell else { return UITableViewCell() }
        cell.setup(model: viewModel.getActualTransaction(index: indexPath.row))
        return cell
    }
    
    
}
