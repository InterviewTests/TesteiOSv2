//
//  String+LocalizedKey.swift
//  BankSantanderTata
//
//  Created by Wagner Rodrigues on 07/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import Foundation

extension String {
    
    public init(withCustomIdentifier identifier: CustomIdentifier) {
        self.init(NSLocalizedString(identifier.key, comment: ""))
    }
    
    public init(withCustomIdentifier identifier: CustomIdentifier, comment: String) {
        self.init(NSLocalizedString(identifier.key, comment: comment))
    }
    
}
