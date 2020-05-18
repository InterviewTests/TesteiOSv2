//
//  UserModel.swift
//  challenge-santander
//
//  Created by Hugo Ferreira on 16/05/20.
//  Copyright © 2020 Hugo Ferreira. All rights reserved.
//

import Foundation



struct UserModel: Decodable {
    var userId : Int?
    var name : String?
    var bankAccount : String?
    var agency : String?
    var balance : Float?
    
}

struct UserAccount: Decodable {
    let userAccount: UserModel?
    //let error: Error?
}


