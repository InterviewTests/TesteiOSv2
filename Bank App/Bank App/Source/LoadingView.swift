//
//  LoadingView.swift
//  Bank App
//
//  Created by Chrystian Salgado on 20/02/19.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import UIKit

class LoadingView {
    var spinningView: UIActivityIndicatorView?
    
    init() {
        self.spinningView = UIActivityIndicatorView(style: .gray)
    }
    
    func show(in view: UIView) {
        if let _ = spinningView {
            spinningView?.center = view.center
            spinningView?.startAnimating()
            view.addSubview(spinningView!)
        }
    }
    
    func dismiss() {
        spinningView?.stopAnimating()
        spinningView = nil
    }
}
