//
//  RegexEnum.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 11/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

enum Regex: String {
    case password = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9]).+$"
    case email = "[a-zA-Z0-9][a-zA-Z0-9._-]{1,64}+@[a-zA-Z0-9-]{1,63}+\\.[a-zA-Z]{2,63}(?:\\.[a-zA-Z]{2,63})?"
    case number = "^[0-9]*$"
}
