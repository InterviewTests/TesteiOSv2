//
//  UIStoryboard+Instantiate.swift
//  BankSantanderTata
//
//  Created by Wagner Rodrigues on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    convenience init(name: String) {
        self.init(name: name, bundle: nil)
    }
    
    func instantiateViewController<T: UIViewController>() -> T {
        let identifier = String(describing: T.self)
        guard let viewController: T = instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Failed to instantiate ViewController with identifier '\(identifier)'")
        }
        return viewController
    }
}
