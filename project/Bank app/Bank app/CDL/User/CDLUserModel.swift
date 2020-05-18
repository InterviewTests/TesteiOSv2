//
//  CDLUserModel.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

class CDLUserModel : CommonDataLayerBaseModel, Codable{
    var id : Int?
    
    override init() {
        //TODO
    }
    //enum to match model properties and JSON names
    enum CodingKeys: String, CodingKey {
        case id = "id"
    }
    
}
