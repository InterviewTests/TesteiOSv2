//
//  AuthUserViewModel.swift
//  Presenter
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public struct AuthUserViewModel {
    public var nameUser: String?
    public var password: String?
    
    public init(nameUser: String?, password: String?) {
        self.nameUser = nameUser
        self.password = password
    }
}
