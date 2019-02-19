//
//  String+Account.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 17/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

extension String {
  struct Account {
    static var accountLabel: String {
      return "ACCOUNT_ACCOUNT_LABEL".localized
    }

    static var balanceLabel: String {
      return "ACCOUNT_BALANCE_LABEL".localized
    }

    static var statementHeaderLabel: String {
      return "ACCOUNT_STATEMENT_HEADER_LABEL".localized
    }
  }
}
