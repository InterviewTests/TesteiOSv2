//
//  ColorsNames.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 08/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

enum Colors: String {
    case TextFieldBorderColor = "TextFieldBorderColor"
    case ButtonBackgroundColor = "ButtonBackgroundColor"
    case ShadowCellColor = "ShadowCellColor"
    case BorderCellColor = "BorderCellColor"
    
    var description: String {
        return self.rawValue
    }
}
