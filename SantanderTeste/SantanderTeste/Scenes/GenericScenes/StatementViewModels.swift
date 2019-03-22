//
//  StatementViewModels.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 18/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation

class StatementViewModels{
    
    static let cellReuseIdentifier = "StatementCell"
    
    struct Statement {
        
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {
            let title: String
            let description: String
            let date: String
            let value: String
        }
    }
}
