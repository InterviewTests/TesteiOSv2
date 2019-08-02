//
//  HomeDataSource.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

protocol HomeDataSourceDelegate: class {
    func doLogout()
}

class HomeDataSource: NSObject {
    private var presenter: HomePresenter
    private var delegate: HomeDataSourceDelegate?
    
    init(presenter: HomePresenter, delegate: HomeDataSourceDelegate) {
        self.presenter = presenter
        self.delegate = delegate
    }
}

extension HomeDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension HomeDataSource {
    class func setupHome(tableView: UITableView?) {
        tableView?.registerNib(cellClass: InfoCell.self)
        tableView?.registerNib(cellClass: TransactionCell.self)
    }
}
