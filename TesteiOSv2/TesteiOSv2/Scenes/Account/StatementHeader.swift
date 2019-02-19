//
//  StatementHeader.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 19/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import UIKit

import Cartography

final class StatementHeader: UIView {
  public private(set) var titleLabel: UILabel = {
    let label = UILabel()
    label.font = .h2Font
    label.textColor = .darkText
    label.text = String.Account.statementHeaderLabel
    return label
  }()

  init() {
    super.init(frame: .zero)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    addSubviews()
    addConstraints()

    backgroundColor = .tableViewBackgroundColor
  }

  private func addSubviews() {
    addSubview(titleLabel)
  }

  private func addConstraints() {
    constrain(self, titleLabel) { cell, title in
      title.top == cell.top + 8
      title.left == cell.left + 18
      title.bottom == cell.bottom - 8
    }
  }
}
