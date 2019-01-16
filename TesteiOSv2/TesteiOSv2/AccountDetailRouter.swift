//
//  AccountDetailRouter.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 16/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

class AccountDetailRouter : AccountDetailRoutingLogic{
    
    weak var viewController : AccountDetailViewController?
    
    func logOut() {
        guard let accountViewController = viewController else{return}
        accountViewController.dismiss(animated: true, completion: nil)
    }
    
    
}
