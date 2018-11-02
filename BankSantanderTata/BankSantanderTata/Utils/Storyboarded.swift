//
//  Storyboarded.swift
//  BankSantanderTata
//
//  Created by Wagner Rodrigues on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    
    static var storyboardName: String { get }
    static var storyboard: UIStoryboard { get }
    
}

extension Storyboarded {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: nil)
    }
    
}
