//
//  IntroPresenter.swift
//  Bank App
//
//  Created by Chrystian on 24/11/18.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

protocol IntroPresenterLogic {
    
    func showHistoryData()
}

class IntroPresenter: IntroPresenterLogic {
    
    weak var viewController: IntroControllerDisplayLogic?
    
    func showHistoryData() {
        
        // ...
    }
}
