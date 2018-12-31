//
//  BankError.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 30/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

struct BankError: Decodable {
    let message: String?
    let code: Int?
}
