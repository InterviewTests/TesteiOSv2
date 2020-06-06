//
//  AuthClientEndpoint.swift
//  Data
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public enum AuthClientEndpoint {
    case login
    
    public var url: URL? {
        return URL(string: "https://bank-app-test.herokuapp.com/api/login")
    }
}
