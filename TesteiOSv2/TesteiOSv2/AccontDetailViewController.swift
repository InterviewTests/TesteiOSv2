//
//  AccontDetailViewController.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit
import SnapKit

class AccontDetailViewController : UIViewController, UITableViewDelegate, UITableViewDataSource , AccountDetailViewControllerProceed{
    
    var interactor : AccountDetailBussinessLogic?
    
    lazy var headView : HeadView = {
        let headView = HeadView()
        return headView
    }()
    
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: self.view.frame)
        //tableView.register(UpcomingMovieListCell.self, forCellWithReuseIdentifier: UPCOMING_MOVIECOLLECTION_CELL)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        return tableView
    }()
    
    /**
     AccontDetailViewController init.
     
     - parameters:
     - user: UserAccount.
     */
    init(user: UserAccount){
        super.init(nibName: nil, bundle: nil)
        setup()
        self.callIteractor(user: user)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.setupView()
        setup()
    }

    /**
     Setup LoginViewController protocols.
     */
    private func setup()
    {
        let viewController = self
        let interactor = AccountDetailInteractor()
        let presenter = AccountDetailPresenter()
      //  let router = LoginRouter()
        viewController.interactor = interactor
      //  viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
      // router.viewController = viewController
       // router.dataStore = interactor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    /**
     Set MovieDetailViewController interactor movie value.
     
     - parameters:
     - movie: Movie.
     */
    private func callIteractor(user: UserAccount){
        guard let interactor = self.interactor else{return}
        interactor.updateUserAccountDetail(user: user)
    }
    
    func updateHeader(account: AccountDetailHeaderModel) {
        self.headView.userName.text = account.name
        self.headView.accontNumberLabel.text = account.bankAccount
        self.headView.accontValueLabel.text = account.value
    }
    func updateAccountValue(value: String){
        self.headView.accontValueLabel.text = value
    }
}

extension AccontDetailViewController : ViewCode{
    func buildViewHierarchy() {
        self.view.addSubview(headView)
    }
    
    func setupConstraints() {
        self.headView.snp.makeConstraints{ make in
            make.top.right.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.347826)
        }
    }
    
    func setupAdditionalConfigurations() {
        
    }
    
    
}
