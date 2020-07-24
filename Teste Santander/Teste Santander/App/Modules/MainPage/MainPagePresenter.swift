//
//  MainPagePresenter.swift
//  Teste Santander
//
//  Created by VM on 23/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

import Foundation
import UIKit

class MainPagePresenter: ViewToMainPagePresenterProtocol {
    var view: PresenterToMainPageViewProtocol?
    var interactor: PresenterToMainPageInteractorProtocol?
    var router: PresenterToMainPageRouterProtocol?
    
}

extension MainPagePresenter: InteractorToMainPagePresenterProtocol {
    
}
