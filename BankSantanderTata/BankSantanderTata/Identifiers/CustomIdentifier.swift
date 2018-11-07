//
//  CustomIdentifier.swift
//  BankSantanderTata
//
//  Created by Wagner Rodrigues on 07/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import Foundation

public protocol CustomIdentifier {
    var key: String { get }
}

extension CustomIdentifier where Self: RawRepresentable, Self.RawValue == String {
    
    public var key: String { return self.rawValue }
    
}
