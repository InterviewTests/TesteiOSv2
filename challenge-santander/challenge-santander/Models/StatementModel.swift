//
//  StatementModel.swift
//  challenge-santander
//
//  Created by Hugo Ferreira on 16/05/20.
//  Copyright © 2020 Hugo Ferreira. All rights reserved.
//

import Foundation


struct StatementModel: Decodable {
     var title: String?
     var desc : String?
     var date : String?
     var value : Float?
}


struct StatementList: Decodable {
    let statementList: [StatementModel]?
    //let error: Error?
}
