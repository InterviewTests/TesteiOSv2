//
//  ErrorModel.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import Foundation

struct ErrorModel: Decodable {
    
    let code: Int?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case message
    }
}
