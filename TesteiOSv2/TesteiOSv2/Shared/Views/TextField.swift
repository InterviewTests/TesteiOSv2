//
//  TextField.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 16/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import UIKit

final class TextField: UITextField {
  init() {
    super.init(frame: .zero)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    let viewFrame = CGRect(x: 0, y: 0, width: 16, height: 50)
    let leftView = UIView(frame: viewFrame)
    leftView.isUserInteractionEnabled = false
    let rightView = UIView(frame: viewFrame)
    rightView.isUserInteractionEnabled = false

    self.leftView = leftView
    self.leftViewMode = .always
    self.rightView = rightView
    self.rightViewMode = .always

    borderStyle = .roundedRect
  }
}
