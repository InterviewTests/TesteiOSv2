//
//  ViewController.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 14/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let login = UserLoginAlamofireGateway()
        login.authLogin(user: "rtestse", password: "testse") { user in
            
            print(user.name)
        }
    }


}

