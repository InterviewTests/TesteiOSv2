//
//  Mask.swift
//  SwiftUtils
//
//  Created by Bruno Maciel on 10/12/20.
//  Copyright © 2020 brunomaciel. All rights reserved.
//

import UIKit

/* ===== Global Variables ===== */
enum MaskStyle: String {
    case agency = "|00|.|000000|-|0|"
    
    var limitDigits: Int {
        return self.rawValue.onlyNumbers().count
    }
}

//* ===== Class ===== */
class Mask: NSObject {
    // MARK: Static Methods
    static func mask(_ str: String, as maskFormat: MaskStyle) -> String {
        var string: String = str
        if str.count > maskFormat.limitDigits {
            string = String(str.prefix(maskFormat.limitDigits))
        }
        
        let maskString = maskFormat.rawValue.replacingOccurrences(of: "|", with: "")

        for (index, character) in maskString.enumerated() {
            if character != "0" && index < string.count {
                string.insert(character, at: string.index(string.startIndex, offsetBy: index))
            }
        }
        return string
    }
    
}


/* ===== Extensions Needed ===== */
extension String {
    fileprivate func onlyNumbers() -> String {
        guard !isEmpty else { return "" }

        return replacingOccurrences(of: "\\D", with: "", options: .regularExpression, range: startIndex..<endIndex)
    }
}
