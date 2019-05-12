//
//  Loading.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright © 2019 Sakura Soft. All rights reserved.
//

import UIKit

class Loading: UIView {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    class func instanceFromNib(rect: CGRect) -> Loading? {
        let view = UINib(nibName: "Loading", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? Loading
        view?.frame = rect
        return view
    }
}
