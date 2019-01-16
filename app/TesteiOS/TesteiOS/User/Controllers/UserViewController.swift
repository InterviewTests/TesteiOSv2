//
//  UserViewController.swift
//  TesteiOS
//
//  Created by Douugr on 14/01/2019.
//  Copyright © 2019 doug. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var userView: UserView! {
        didSet {
            userView.delegate = self
        }
    }

}

extension UserViewController: UserViewDelegate {
    func logout() {
        self.dismiss(animated: true, completion: nil)
    }
}
