//
//  StatemntList.swift
//  TesteiOSSantander
//
//  Created by julio.c.tanchiva on 12/19/18.
//  Copyright © 2018 julio.c.tanchiva. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
struct Statements: Decodable {
    let statementList: [statementList]!
    let error: erro
}
struct statementList: Decodable {
    let title:String
    let desc:String
    let date: String
    let value: Double
}

