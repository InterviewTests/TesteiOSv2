//
//  AccountTarget.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import Foundation
import Moya

enum AccountTarget: BaseTarget {

    case statements(Account.Request)
}

extension AccountTarget {

    var path: String {
        switch self {
        case .statements(let request):
            return "statements/\(request.accountId)"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }
}
