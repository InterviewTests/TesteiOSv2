//
//  Double.swift
//  TesteiOSv2
//
//  Created by Bruno on 10/11/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import Foundation

extension Double {
    func toBrazilianCurrency() -> String {
        return "R$ " + "\(self)"
    }
}
