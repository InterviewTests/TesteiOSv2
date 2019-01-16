//
//  AccontDetailViewController.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit

class AccontDetailViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: self.view.frame)
        //tableView.register(UpcomingMovieListCell.self, forCellWithReuseIdentifier: UPCOMING_MOVIECOLLECTION_CELL)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
