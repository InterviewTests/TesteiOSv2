//
//  IntroPresenter.swift
//  Bank App
//
//  Created by Chrystian on 24/11/18.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

protocol IntroPresentationLogic {
    
    func showHistoryController()
}

class IntroPresenter: IntroPresentationLogic {
    
    weak var viewController: IntroDisplayLogic?
    
    func showHistoryController() {
        viewController?.presentDetailController()
    }
}
