//
//  ErrorResponse.swift
//  BankApp
//
//  Created by Tripmatix on 19/02/19.
//  Copyright © 2019 Tripmatix. All rights reserved.
//

import Foundation

struct ErrorResponse: Decodable{
    let code: Int?
    let message: String?
}
