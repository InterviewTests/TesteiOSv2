//
//  Statement.swift
//  TesteiOSv2
//
//  Created by Capgemini on 22/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation

struct Statement : Equatable {
    
    // MARK: Statements from User
    var title: String
    var desc: String
    var date: String
    var value: Double
    
    init(_ dic: [String:NSObject]) {
        self.title  = dic["title"] as? String ?? ""
        self.desc   = dic["desc"] as? String ?? ""
        self.date   = dic["date"] as? String ?? ""
        self.value  = dic["value"] as? Double ?? 0
    }
}
