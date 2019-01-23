//
//  statementsViewController.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 21/01/19.
//  Copyright (c) 2019 ti alto nivel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol statementsDisplayLogic: class {
    func displaySomething(viewModel: statements.Something.ViewModel)
}

class statementsViewController: UIViewController, statementsDisplayLogic {
    var interactor: statementsBusinessLogic?
    var router: (NSObjectProtocol & statementsRoutingLogic & statementsDataPassing)?
    var repository: UserRepository?

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = statementsInteractor()
        let presenter = statementsPresenter()
        let router = statementsRouter()
        let repository = UserRepository.shared
        viewController.interactor = interactor
        viewController.router = router
        viewController.repository = repository
        interactor.presenter = presenter
        interactor.repository = repository
        presenter.viewController = viewController
        presenter.repository = repository
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }

    // MARK: Do something

    // @IBOutlet weak var nameTextField: UITextField!

    func doSomething() {
        
        let request = statements.Something.Request()
        interactor?.doSomething(request: request)
    }

    func displaySomething(viewModel: statements.Something.ViewModel) {
        // nameTextField.text = viewModel.name
    }
}
