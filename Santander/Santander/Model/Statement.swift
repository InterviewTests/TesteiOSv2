//
//  Statement.swift
//  Santander
//
//  Created by ely.assumpcao.ndiaye on 09/01/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

struct Statement : Decodable {
    
    var title: String?
    var desc : String?
    var date: String?
    var value: String?
    
    init(title: String?, desc: String?, date: String?, value: String?) {
        self.title = title
        self.desc = desc
        self.date = date
        self.value = value
    }
}


