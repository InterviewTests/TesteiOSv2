//
//  StatemntList.swift
//  TesteiOSSantander
//
//  Created by julio.c.tanchiva on 12/19/18.
//  Copyright © 2018 julio.c.tanchiva. All rights reserved.
//

import Foundation
struct State: Decodable {
    
    let cells: [Cell]!
}
struct Cell: Decodable {
    let id: Int?
    let type: Int?
    let message: String?
    let typefield: MetadataType?
    let hidden: Bool?
    let topSpacing: CGFloat?
    let show: Int?
    let required: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case message = "message"
        case typefield = "typefield"
        case hidden = "hidden"
        case topSpacing = "topSpacing"
        case show = "show"
        case required = "required"
        
    }
}
