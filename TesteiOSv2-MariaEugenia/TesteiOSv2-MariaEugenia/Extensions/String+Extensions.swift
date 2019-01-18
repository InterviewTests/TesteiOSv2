//
//  String+Extensions.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 13/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import UIKit

extension String {
    
    func isValidPassord() -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{1,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    
    func convertDate() -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        if let showDate = inputFormatter.date(from: self) {
            inputFormatter.dateFormat = "dd/MM/yyyy"
            return inputFormatter.string(from: showDate)
        } else { return self }
    }

}
