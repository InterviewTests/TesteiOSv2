//
//  Statement.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 29/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import Foundation

struct ListOfStatements: Codable {
    var statementList: [Statement]?
}

struct Statement: Codable {
    var title: String?
    var desc: String?
    var date: String?
    var value: Double?
}
