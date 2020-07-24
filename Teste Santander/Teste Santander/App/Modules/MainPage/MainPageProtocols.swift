//
//  MainPageProtocols.swift
//  Teste Santander
//
//  Created by VM on 23/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToMainPageViewProtocol: class {
    
}

protocol InteractorToMainPagePresenterProtocol: class {
    
}

protocol PresenterToMainPageInteractorProtocol: class {
    var presenter: InteractorToMainPagePresenterProtocol? { get set }
    
}

protocol PresenterToMainPageRouterProtocol: class {
    static func createModule() -> UIViewController
    
}

protocol ViewToMainPagePresenterProtocol: class {
    var view: PresenterToMainPageViewProtocol? { get set }
    var interactor: PresenterToMainPageInteractorProtocol? { get set }
    var router: PresenterToMainPageRouterProtocol? { get set }
}
