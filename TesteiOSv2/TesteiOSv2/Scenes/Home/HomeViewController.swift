//
//  HomeViewController.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 20/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var cpfLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    private let dataSource = HomeDataScource()
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    private func setup()
    {
       // let viewController = self
       // let interactor = HomeInteractor()
        //let presenter = HomePresenter()
        //let router = HomeRouter()
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
    }
    
    private func configTableView() {
        tableView.dataSource = dataSource as? UITableViewDataSource
        tableView.delegate = dataSource
        dataSource.tableView = tableView
        dataSource.registerNibs(in: tableView)
    }
    
    
    @IBAction func logout(_ sender: Any) {
    
    }
    
}

