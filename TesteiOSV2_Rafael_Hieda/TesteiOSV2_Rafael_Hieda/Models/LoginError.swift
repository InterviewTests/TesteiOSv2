//
//  Error.swift
//  TesteiOSV2_Rafael_Hieda
//
//  Created by Rafael  Hieda on 10/27/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import UIKit

public class LoginError: NSObject {
    
    public var code : Int?
    public var message : String?
        
    public func Success() -> Bool
    {
        return code == nil && message == nil
    }
}
