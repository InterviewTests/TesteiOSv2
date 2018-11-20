//
//  Error+Util.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

extension Error {
    
    func message() -> String {
        if let message = (self as NSError).userInfo["error"] as? String {
            return message
        } else {
            return self.localizedDescription
        }
    }
}
