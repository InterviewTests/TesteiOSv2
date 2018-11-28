//
//  Transaction.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 28/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import Foundation

struct ResponseTransactions : Decodable {
    var statementList : [Transaction]
}

struct Transaction : Decodable {
    var title : String
    var desc : String
    var date : String
    var value : Float
}
