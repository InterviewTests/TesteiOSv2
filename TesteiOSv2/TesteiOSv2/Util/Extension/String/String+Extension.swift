//
//  String+Extension.swift
//  cs-ios
//
//  Created by Felipe perius on 24/01/17.
//  Copyright © 2017 Altran-AIS. All rights reserved.
//

import UIKit

extension String {

    func toDate(withFormat format: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else {
            preconditionFailure("Wrong date format")
        }
        return date
    }

}
