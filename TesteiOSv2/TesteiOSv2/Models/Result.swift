//
//  Result.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 11/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

enum Result<Value, Error: Swift.Error> {
  case success(Value)
  case failure(Error)
}

