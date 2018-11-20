//
//  HomeDataScource.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 20/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

class HomeDataScource: NSObject {
    
    var StatmentViewModel: [HomeModel.StatementViewModel] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    weak var tableView: UITableView?
    

    func registerNibs(in tableView: UITableView) {
        tableView.registerNib(StatmentTableViewCell.self)
        tableView.registerNib(HeaderSectionTableViewCell.self)
    }
    
    private func generateStatmentCell(forTableView tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithDefaultIdentifier(StatmentTableViewCell.self) else {
            return UITableViewCell()
        }
        
        return cell
    }

}

// MARK: Cells creation
extension HomeDataScource:UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return generateStatmentCell(forTableView: tableView, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header: UIView?
        header = generateHeaderView(tableView, viewForHeaderInSection: section)
        
        return header
    }
    
    func generateHeaderView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = tableView.dequeueReusableCell(withIdentifier: HeaderSectionTableViewCell.identifier) else {
            return UITableViewCell()
        }
        return header
    }

}


extension HomeDataScource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return StatmentTableViewCell.cellHeight
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HeaderSectionTableViewCell.cellHeight
    }
    
}
