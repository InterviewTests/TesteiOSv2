//
//  LoginRouter.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

protocol LoginRouterProtocol: AnyObject {
    func presentDetailView()
}

final class LoginRouter: BaseRouter<LoginPresenterProtocol, LoginView>, LoginRouterProtocol {

    internal func presentDetailView() {
        //TODO
    }
}
