//
//  Error+Util.swift
//  BBInovacao
//
//  Created by Antonio Silva on 31/07/17.
//  Copyright © 2017 AIS. All rights reserved.
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
