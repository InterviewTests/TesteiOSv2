//
//  StatementAPIResponseTests.swift
//  TesteiOSv2Tests
//
//  Created by Gilson Gil on 18/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

@testable import TesteiOSv2

import Quick
import Nimble

final class StatementAPIResponseSpec: QuickSpec {
  // MARK: Subject under test
  override func spec() {
    describe("statements api response") {
      context("given a valid json") {
        let bundle = Bundle(for: StatementAPIResponseSpec.self)
        let path = bundle.path(forResource: "Mock_API_Statements.json", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        let json = try? Data(contentsOf: url)

        it("should instantiate correct model") {
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .formatted(DateFormatter.apiDateFormatter)
          let object = try? decoder.decode(StatementAPIResponse.self, from: json!)
          expect(object).toNot(beNil())
          expect(object?.statements).toNot(beNil())
          expect(object?.statements).toNot(beEmpty())
        }
      }
    }
  }
}
