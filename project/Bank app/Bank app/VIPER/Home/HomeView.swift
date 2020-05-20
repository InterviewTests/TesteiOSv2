//
//  HomeView.swift
//  Bank app
//
//  Created by mmalaqui on 19/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

class HomeView: BaseView<HomePresenterProtocol> {

    let screenName = "Home"
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var balanceValueLabel: UILabel!
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.i18N()
        
        self.presenter?.homeViewDidLoad()
    }
    
    
    @IBAction func logoutActionButton(_ sender: Any) {
        //TODO
    }
    
    
    deinit {
        //clean all references
        self.presenter?.cleanup()
    }
    
}

// MARK: Extensions declaration of all extension and implementations of protocols 
extension HomeView: BaseViewControllerRefresh {
    func refresh() {
        //TODO: implement all calls needed to refresh the UI
    }
    
    func i18N() {
        self.title = "Home"
    }
    
    func initializeUI() {
        //TODO: implement all UI Setups

    }
}
