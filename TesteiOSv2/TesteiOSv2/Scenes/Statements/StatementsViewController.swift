//
//  StatementsViewController.swift
//  TesteiOSv2
//
//  Created by Jose Neves on 11/01/19.
//  Copyright © 2019 joseneves. All rights reserved.
//

import UIKit

protocol StatementsDisplayLogic: class {

}

class StatementsViewController: UIViewController, StatementsDisplayLogic {
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    var interactor: StatementsBusinessLogic?
    var router: (NSObjectProtocol)?
    var user: User?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userLabel.text = self.user?.name
        self.accountLabel.text = "\(self.user?.bankAccount ?? "") / \(self.user?.agency ?? "")"
        self.balanceLabel.text = "R$\(self.user?.balance ?? 0)"
    }
    
    func setUser(user: User) {
        self.user = user
    }
    
    private func setup() {
        let viewController = self
        let interactor = StatementsInteractor()
        let presenter = StatementsPresenter()
        let router = StatementsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
}
