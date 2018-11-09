//
//  Statement.swift
//  TesteiOSv2
//
//  Created by Bruno on 09/11/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import Foundation

struct Statement: Decodable {
    let title: String
    let desc: String
    let date: String
    let value: Double
}
