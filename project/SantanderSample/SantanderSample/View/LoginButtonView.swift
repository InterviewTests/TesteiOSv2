//
//  LoginButton.swift
//  SantanderSample
//
//  Created by Virgilius Santos on 26/10/18.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import UIKit

class LoginButtonView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: LoginButtonView.self), owner: self, options: nil)
        
        addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
    }


}
