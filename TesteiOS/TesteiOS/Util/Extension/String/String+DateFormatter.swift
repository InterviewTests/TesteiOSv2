//
//  String+DateFormatter.swift
//  TesteiOS
//
//  Created by Fernando Gomes on 14/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation

extension String {
    func convertoToDate(withFormat format: String = "yyyy-mm-dd") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        guard let date = formatter.date(from: self) else {
            return nil
        }
        return date
    }
}
