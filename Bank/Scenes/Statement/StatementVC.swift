//
//  StatementVC.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import UIKit

class StatementVC: BankViewController {
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupView()
    }
    
    var interactor: StatementBusinessLogic?
    var router: (NSObjectProtocol & StatementRoutingLogic & StatementDataPassing)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupView() {
        let viewController = self
        let interactor = StatementInteractor()
        let router = StatementRouter()
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
        router.dataStore = interactor
    }
}
