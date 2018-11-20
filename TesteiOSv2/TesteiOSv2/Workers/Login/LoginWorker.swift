//
//  LoginWorker.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

class LoginWorker {

    //MARK: login
    class func authLogin(user: String, pass: String, completion:  @escaping (_ user: User?, _ error: String?) -> Void) {
        _ = UserService.authLogin(user:user, pass:pass).subscribe(onNext: { (user) in
            completion(user, nil)
        }, onError: { (error) in
            completion(nil, error.message())
        }, onCompleted: nil, onDisposed: nil)
    }
}
