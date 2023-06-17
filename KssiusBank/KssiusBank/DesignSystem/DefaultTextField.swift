//
//  BankTextField.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 17/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import UIKit

class DefaultTextField: UITextField {

    // MARK: - Constants
    
    private var padding = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 20)
    private let fontSize = 15.0

    // MARK: - Properties
    lazy var viewPasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(asset:  Asset.eye), for: .normal)
        button.setImage(UIImage(asset:  Asset.openEye), for: .selected)
        button.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
       return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Setup

    private func setup() {
        borderStyle = .roundedRect
        textColor = .bankLightGray
        font = .bankFont?.withSize(fontSize)
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.bankGray.cgColor
        layer.cornerRadius = 4
    }

    @objc private func doneButtonAction() {
        self.resignFirstResponder()
    }

    func showPasswordToggle(){
        padding = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 50)
        rightView = viewPasswordButton
        rightViewMode = .always

    }
    @objc private func togglePasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        viewPasswordButton.isSelected.toggle()
    }

    // MARK: - Rect

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
