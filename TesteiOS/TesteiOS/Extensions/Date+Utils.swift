//
//  Date+Utils.swift
//  TesteiOS
//
//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}
