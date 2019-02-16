//
//  ServiceError.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 16/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

enum ServiceError: ErrorProtocol {
  case unknown

  var code: Int {
    switch self {
    case .unknown:
      return -300
    }
  }

  var localizedDescription: String {
    switch self {
    case .unknown:
      return "Erro desconhecido."
    }
  }
}
