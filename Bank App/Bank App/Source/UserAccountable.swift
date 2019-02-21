//
//  UserAccountable.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 29/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

protocol UserAccountable {
    var userId: Int? { get set }
    var name: String? { get set }
    var bankAccount: String? { get set }
    var agency: String? { get set }
    var balance: Double? { get set }
}
