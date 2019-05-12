//
//  Constants+Regex.swift
//  TesteSantander
//
//  Created by Sidney Silva on 12/05/19.
//  Copyright © 2019 Sakura Soft. All rights reserved.
//

import UIKit

extension Constants.Regex {
    static let emailRegex = "[a-zA-Z0-9][a-zA-Z0-9._-]{1,64}+@[a-zA-Z0-9-]{1,63}+\\.[a-zA-Z]{2,63}(?:\\.[a-zA-Z]{2,63})?"
    static let capitalLetterRegex = ".*[A-Z]+.*"
    static let numberRegex = ".*[0-9]+.*"
    static let specialCharacterRegex = ".*[!&^%$#@()/]+.*"
}
