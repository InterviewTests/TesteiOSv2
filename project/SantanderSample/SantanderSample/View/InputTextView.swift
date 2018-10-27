//
//  InputView.swift
//  SantanderSample
//
//  Created by Virgilius Santos on 26/10/18.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import UIKit

class InputTextView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    let attributes
        = [NSAttributedString.Key.foregroundColor: UIColor.grayPlaceholderApp]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: InputTextView.self), owner: self, options: nil)
        
        addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        backgroundColor = .clear
    }
    
    func setPlaceholder(_ string: String) {
        textField.attributedPlaceholder = NSAttributedString(string: string,
                                                             attributes: attributes)
    }

}
