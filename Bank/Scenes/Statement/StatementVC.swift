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
    func setStatements(statementsDisplay: [StatementView.ViewModel.DisplayedStatementItem])
}

class StatementVC: BankViewController, StatementDisplayLogic, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblAccount: UILabel!
    @IBOutlet var lblBalance: UILabel!
    @IBOutlet var btnSignout: UIButton!
    @IBOutlet var tblStatements: UICollectionView!
    
    var interactor: StatementBusinessLogic?
    var router: (NSObjectProtocol & StatementRoutingLogic & StatementDataPassing)?
    var statementsDisplay: [StatementView.ViewModel.DisplayedStatementItem]?
    
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
        interactor = nil
        router?.navigateToLogin()
        router = nil
    }
    
    func setStatements(statementsDisplay: [StatementView.ViewModel.DisplayedStatementItem]) {
        self.statementsDisplay = statementsDisplay
        tblStatements.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statementsDisplay?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "statementCell", for: indexPath) as! StatementCell
        cell.setupView()
        cell.loadData(item: statementsDisplay?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath)
        return sectionHeader
    }
}
