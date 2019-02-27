//
//  StatementVC.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import UIKit

protocol StatementDisplayLogic: class {
    func showErrorMessage(message: String)
    func setUserData(_ user: StatementView.ViewModel.DisplayedStatementUser)
}

class StatementVC: BankViewController, StatementDisplayLogic {
    
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblAccount: UILabel!
    @IBOutlet var lblBalance: UILabel!
    @IBOutlet var btnSignout: UIButton!
    
    var interactor: StatementBusinessLogic?
    var router: (NSObjectProtocol & StatementRoutingLogic & StatementDataPassing)?
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSignout.addTarget(self, action: #selector(signout), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.loadViewData()
    }
    
    private func setupView() {
        let viewController = self
        let interactor = StatementInteractor()
        let presenter = StatementPresenter()
        let router = StatementRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func setUserData(_ user: StatementView.ViewModel.DisplayedStatementUser) {
        lblUserName.text = user.name
        lblAccount.text = user.account
        lblBalance.text = user.balance
    }
    
    @objc func signout() {
        let localInteractor = interactor as! StatementInteractor
        localInteractor.cleanData()
        localInteractor.presenter = nil
        router?.navigateToLogin()
    }
}
