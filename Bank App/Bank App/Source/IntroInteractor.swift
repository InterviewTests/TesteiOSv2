//
//  IntroInteractor.swift
//  Bank App
//
//  Created by Chrystian on 24/11/18.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

protocol UserHistoryData {
    
    var user: User? { get set }
}

class IntroInteractor: UserHistoryData {
    
    var presenter: IntroPresenterLogic?
    var user: User?
    
}
