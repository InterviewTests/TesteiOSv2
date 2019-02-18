//
//  ErrorProtocol.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 16/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

protocol ErrorProtocol: Error {
  var code: Int { get }
  var localizedDescription: String { get }
}
