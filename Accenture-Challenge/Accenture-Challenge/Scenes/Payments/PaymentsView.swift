//
//  PaymentsView.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

class PaymentsView: UIView {
    
    private unowned var headerView: PaymentMainHeaderView
    private unowned var tableView: UITableView
    
    init(frame: CGRect,
         headerView: PaymentMainHeaderView,
         tableView: UITableView) {
        self.headerView = headerView
        self.tableView = tableView
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PaymentsView: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        addSubview(headerView)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        headerView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(232)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func configureViews() {
        backgroundColor = Payments.Constants.Colors.backgroundColor
        
        tableView.bounces = false
        tableView.alwaysBounceVertical = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
}
