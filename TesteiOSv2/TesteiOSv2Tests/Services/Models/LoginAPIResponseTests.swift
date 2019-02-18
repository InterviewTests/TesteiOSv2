//
//  LoginAPIResponseTests.swift
//  TesteiOSv2Tests
//
//  Created by Gilson Gil on 18/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

@testable import TesteiOSv2

import Quick
import Nimble

final class LoginAPIResponseSpec: QuickSpec {
  // MARK: Subject under test
  override func spec() {
    describe("login api response") {
      context("given a valid json") {
        let bundle = Bundle(for: LoginAPIResponseSpec.self)
        let path = bundle.path(forResource: "Mock_API_Login.json", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        let json = try? Data(contentsOf: url)

        it("should instantiate correct model") {
          let object = try? JSONDecoder().decode(LoginAPIResponse.self, from: json!)
          expect(object).toNot(beNil())
        }
      }
    }
  }
}
