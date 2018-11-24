//
//  ViewController.swift
//  Bank App
//
//  Created by Chrystian on 21/11/18.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import UIKit

protocol LoginControllerDisplayLogic: class {
//    func
}

class LoginViewController: UIViewController {
    
    var interactor: LoginInteractor?
    var router: (NSObjectProtocol)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fetchUser() {
        let request = UserLogin.FetchUser.Resquest()
        interactor?.fetchUser(request: request)
    }
    
    @IBAction func actionLogin(_ action: Any) {
        fetchUser()
    }
    
    func displayFetchedUser(viewModel: UserLogin.FetchUser.ViewModel.DisplayUser) {
        // ... perform segue to intro cotroller, pass de usar for another screen
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
}
