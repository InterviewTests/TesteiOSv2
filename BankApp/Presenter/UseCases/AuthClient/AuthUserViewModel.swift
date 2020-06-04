//
//  AuthUserViewModel.swift
//  Presenter
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public struct AuthUserViewModel {
    public var userName: String?
    public var password: String?
    
    public init(userName: String?, password: String?) {
        self.userName = userName
        self.password = password
    }
}
