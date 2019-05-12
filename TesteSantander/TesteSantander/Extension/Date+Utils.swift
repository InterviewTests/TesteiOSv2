//
//  Date+Utils.swift
//  TesteSantander
//
//  Created by Sidney Silva on 12/05/19.
//  Copyright © 2019 Sakura Soft. All rights reserved.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}
