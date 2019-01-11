//
//  StatementModel.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 11/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import UIKit

struct StatementModel: Decodable {
    let statementList: [StatementList]
    let error: ErrorModel
}

struct StatementList: Decodable {
    let title: String?
    let desc: String?
    let date: String?
    let value: Double?
}
