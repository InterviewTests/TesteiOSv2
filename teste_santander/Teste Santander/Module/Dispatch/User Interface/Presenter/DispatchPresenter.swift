//
//  DispatchPresenter.swift
//  Teste Santander
//
//  Created by THIAGO on 04/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class DispatchPresenter: DispatchPresenterInput {
    
    var interactor: LoggedUserInteractorInput
    
    var wireframe: DispatchWireframe
    
    init(wireframe: DispatchWireframe, interactor: LoggedUserInteractorInput) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        if interactor.loggedUser() == nil {
            wireframe.showLogin()
        } else {
            wireframe.showDetail()
        }
    }
}

extension DispatchPresenter: LoggedUserInteractorOutput {}
