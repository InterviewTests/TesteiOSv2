//
//  StatementInteractor.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import Foundation

protocol StatementBusinessLogic {
    
}

protocol StatementDataStore {
    var user: User? { get set }
}

class StatementInteractor: StatementBusinessLogic, StatementDataStore {
    var user: User?
}
