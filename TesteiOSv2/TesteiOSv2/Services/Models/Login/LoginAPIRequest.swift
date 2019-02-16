//
//  LoginAPIRequest.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 16/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

struct LoginAPIRequest: Encodable {
  let user: String
  let password: String
}
