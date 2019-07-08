//
//  ValidationsFields.swift
//  TestSantander
//
//  Created by ely.assumpcao.ndiaye on 10/06/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

class ValidationsFields{
    
    func isValidPassword(passID:String) -> Bool {
        print(passID)
        let passRegEx = "(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$&*])(?=.*[a-z]).{1,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passRegEx)
        return passwordTest.evaluate(with: passID)
    }
}


