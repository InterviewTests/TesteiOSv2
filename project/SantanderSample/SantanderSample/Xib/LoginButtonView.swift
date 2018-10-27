//
//  LoginButton.swift
//  SantanderSample
//
//  Created by Virgilius Santos on 26/10/18.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import UIKit

protocol LoginButtonViewDelegate {
    func buttonAction(_ sender: UIButton)
}

class LoginButtonView: UIView {

    var delegate: LoginButtonViewDelegate?
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.translatesAutoresizingMaskIntoConstraints = false
            loginButton.borderColor = .blueApp
        }
    }
    
    
    @IBAction func loginAction(_ sender: UIButton) {
        delegate?.buttonAction(sender)
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
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        backgroundColor = .clear
    }


}
