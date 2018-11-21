//
//  Double.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 20/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

extension Double {
    func toCurrency() -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale.init(identifier: "pt_BR")
        formatter.numberStyle = .currency
        return formatter.string(from: self as NSNumber)
    }
}
