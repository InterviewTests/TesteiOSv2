//
//  BaseViewController.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

///In our basic viewController, we're gonna set up all methods that we're gonna need.
class BaseViewController: UIViewController {
    public init() { super.init(nibName: nil, bundle: nil) }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
