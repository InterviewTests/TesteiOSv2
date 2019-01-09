//
//  Statement.swift
//  Santander
//
//  Created by ely.assumpcao.ndiaye on 09/01/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

struct Statement : Decodable {
    public private(set) var statementTitle: String?
    public private(set) var statementDesc: String?
    public private(set) var statementDate: String?
    public private(set) var value: String?
}


