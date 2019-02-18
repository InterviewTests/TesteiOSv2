//
//  StatementCell.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 17/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import UIKit

import Cartography

protocol StatementCellDisplayLogic: class {
  func update(with statement: Account.FetchStatements.ViewModel.DisplayedStatement)
}

final class StatementCell: UITableViewCell {
  private let container: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.masksToBounds = false
    view.layer.shadowOffset = CGSize(width: 0, height: 2)
    view.layer.shadowRadius = 2
    view.layer.shadowOpacity = 0.1
    return view
  }()

  public private(set) var titleLabel: UILabel = {
    let label = UILabel()
    label.font = .regularFont
    label.textColor = .lightText
    return label
  }()

  public private(set) var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = .regularFont
    label.textColor = .darkText
    return label
  }()

  public private(set) var dateLabel: UILabel = {
    let label = UILabel()
    label.font = .smallFont
    label.textColor = .lightText
    label.textAlignment = .right
    return label
  }()

  public private(set) var valueLabel: UILabel = {
    let label = UILabel()
    label.font = .largeLightFont
    label.textColor = .darkText
    label.textAlignment = .right
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    addSubviews()
    addConstraints()

    contentView.backgroundColor = .tableViewBackgroundColor
  }

  private func addSubviews() {
    addSubview(container)
    container.addSubview(titleLabel)
    container.addSubview(descriptionLabel)
    container.addSubview(dateLabel)
    container.addSubview(valueLabel)
  }

  private func addConstraints() {
    constrain(self, container) { cell, container in
      container.top == cell.top + 8
      container.left == cell.left + 16
      container.bottom == cell.bottom - 8
      container.right == cell.right - 16
    }

    constrain(
      container,
      titleLabel,
      descriptionLabel,
      dateLabel,
      valueLabel) { container, title, description, date, value in
        title.top == container.top + 10
        title.left == container.left + 14

        description.left == container.left + 14
        description.bottom == container.bottom - 10

        date.top == container.top + 10
        date.right == container.right - 14

        value.right == container.right - 14
        value.bottom == container.bottom - 10
    }
  }
}

extension StatementCell: StatementCellDisplayLogic {
  func update(with statement: Account.FetchStatements.ViewModel.DisplayedStatement) {
    titleLabel.text = statement.title
    descriptionLabel.text = statement.description
    dateLabel.text = statement.date
    valueLabel.text = statement.value
  }
}
