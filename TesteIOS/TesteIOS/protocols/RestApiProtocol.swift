//
//  RestApiProtocol.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 22/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import Foundation

protocol RestApiProtocol {
    func GetStatments(id: String, callback : @escaping (_ statments:Statments?) -> Void)
    func doLogin(user: String, password: String, callback : @escaping (_ userAccount:UserAccount?) -> Void)
}
