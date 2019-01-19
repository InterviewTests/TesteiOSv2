//
//  String+AgencyFormatter.swift
//  Bank App
//
//  Created by Chrystian on 17/01/19.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func toBankAgency() -> String {
        var string = self
        if self.contains("-") {} else { string.insert("-", at: string.index(before: string.endIndex)) }
        if self.contains(".") {} else { string.insert(".", at: string.index(after: string.index(after: string.startIndex))) }
        return string
    }
}
