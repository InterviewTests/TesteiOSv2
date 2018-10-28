//
//  Error.swift
//  TesteiOSV2_Rafael_Hieda
//
//  Created by Rafael  Hieda on 10/27/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import UIKit
import ObjectMapper

public class ResponseError: Mappable {
    
    public var code : Int?
    public var message : String?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
    }
    
        
    public func Success() -> Bool
    {
        return code == nil && message == nil
    }
}
