//
//  BankAPI+Testing.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 12/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation
import Moya

@testable import TesteiOSv2

extension BankAPI {
  var sampleData: Data {
    switch self {
    case .login:
      return stubbedResponse("User")
    case .statements:
      return stubbedResponse("Statements")
    }
  }
  
  func stubbedResponse(_ filename: String) -> Data! {
    let path = Bundle.main.path(forResource: filename, ofType: "json")
    return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
  }
}
