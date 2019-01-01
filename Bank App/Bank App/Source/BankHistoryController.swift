//
//  BankHistoryController.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 24/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation
import UIKit

protocol BankHistoryDisplayLogic: class {
    
    func displayData()
}

class BankHistoryController: UITableViewController, BankHistoryDisplayLogic {
    
    var interactor: BankHistoryInteractionLogic?
    var router: (NSObjectProtocol & BankHistoryRouterLogic & BankHistoryDataPassing)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setup() {
        let viewController = self
        let interactor = BankHistoryInteractor()
        let presenter = BankHistoryPresenter()
        let router = BankHistoryRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func displayData() {
        // ...
    }
    
    @IBAction func actionLogOut(_ sender: Any) {
        performSegue(withIdentifier: "unwindToIntroController", sender: nil)
    }
}

extension BankHistoryController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! BankHistoryTableViewCell
        return cell
    }
}
