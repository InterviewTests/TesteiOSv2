//
//  Login.swift
//  TesteiOSSantander
//
//  Created by julio.c.tanchiva on 12/19/18.
//  Copyright © 2018 julio.c.tanchiva. All rights reserved.
//

import Foundation
import UIKit


struct User: Decodable {
    
    let userAccount: userAccount!
    let error: erro
}
struct userAccount: Decodable{
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
}

struct erro: Decodable {
    
}

