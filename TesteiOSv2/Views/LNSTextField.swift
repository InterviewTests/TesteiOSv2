//
//  LNSTextField.swift
//  TesteiOSv2
//
//  Created by Capgemini on 24/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

class LNSTextField : UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
    }
    
    
}

extension LNSTextField : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
