//
//  LoginProtocols.swift
//  Teste Santander
//
//  Created by VM on 23/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToLoginViewProtocol: class {
    
}

protocol InteractorToLoginPresenterProtocol: class {
    
}

protocol PresenterToLoginInteractorProtocol: class {
    var presenter: InteractorToLoginPresenterProtocol? { get set }
    
}

protocol PresenterToLoginRouterProtocol: class {
    static func createModule() -> UIViewController
    
}

protocol ViewToLoginPresenterProtocol: class {
    var view: PresenterToLoginViewProtocol? { get set }
    var interactor: PresenterToLoginInteractorProtocol? { get set }
    var router: PresenterToLoginRouterProtocol? { get set }
    
}
