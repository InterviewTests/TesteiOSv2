//
//  RouterSpy.swift
//  PresenterTests
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Presenter
import Domain

class RouterSpy {
    
    public var userAccount: UserAccount?
    private var emit: ((UserAccount) -> Void)?
    
    public func observerUserAccount(completion: @escaping (UserAccount) -> Void) {
        emit = completion
    }
}

extension RouterSpy: RouterProtocol {
    func presentBalanceViewController(userAccount: UserAccount) {
        emit?(userAccount)
    }
}
