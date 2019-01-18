//
//  Statement.swift
//  Santander
//
//  Created by ely.assumpcao.ndiaye on 09/01/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

struct StatementList: Decodable {
    
     public private(set) var title: String!
     public private(set) var desc: String!
    public private(set) var date: String!
    public private(set) var value: String!
}


