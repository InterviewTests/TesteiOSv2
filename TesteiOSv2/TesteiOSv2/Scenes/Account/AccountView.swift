//
//  AccountView.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 16/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import UIKit

import Cartography

protocol AccountViewProperties: class {
  var nameLabel: UILabel { get }
  var accountValueLabel: UILabel { get }
  var balanceValueLabel: UILabel { get }
  var tableView: UITableView { get }
}

final class AccountView: UIView, AccountViewProperties {
  private let topView: UIView = {
    let view = UIView()
    view.backgroundColor = .strongBlue
    return view
  }()

  public private(set) var nameLabel: UILabel = {
    let label = UILabel()
    label.font = .h1Font
    label.textColor = .white
    return label
  }()

  public private(set) lazy var logoutButton: UIButton = {
    let image = #imageLiteral(resourceName: "btn_logout")
    let button = UIButton()
    button.setImage(image, for: .normal)
    button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
    return button
  }()

  private let headerView: UIView = {
    let view = UIView()
    view.backgroundColor = .strongBlue
    view.setContentHuggingPriority(.required, for: .vertical)
    view.isUserInteractionEnabled = false
    return view
  }()

  private let accountLabel: UILabel = {
    let label = UILabel()
    label.text = String.Account.accountLabel
    label.font = .smallFont
    label.textColor = .white
    return label
  }()

  public private(set) var accountValueLabel: UILabel = {
    let label = UILabel()
    label.font = .h1Font
    label.textColor = .white
    return label
  }()

  private let balanceLabel: UILabel = {
    let label = UILabel()
    label.text = String.Account.balanceLabel
    label.font = .smallFont
    label.textColor = .white
    return label
  }()

  public private(set) var balanceValueLabel: UILabel = {
    let label = UILabel()
    label.font = .h1Font
    label.textColor = .white
    return label
  }()

  public private(set) var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .plain)
    tableView.backgroundColor = .clear
    tableView.separatorStyle = .none
    tableView.rowHeight = 96
    tableView.allowsSelection = false
    return tableView
  }()

  private weak var viewLogic: AccountViewLogic?

  init(viewLogic: AccountViewLogic) {
    self.viewLogic = viewLogic
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
    addSubview(headerView)
    headerView.addSubview(accountLabel)
    headerView.addSubview(accountValueLabel)
    headerView.addSubview(balanceLabel)
    headerView.addSubview(balanceValueLabel)
    addSubview(tableView)
    addSubview(topView)
    topView.addSubview(nameLabel)
    topView.addSubview(logoutButton)
  }

  private func addConstraints() {
    constrain(self, topView, headerView, tableView) { view, top, header, table in
      top.top == view.top
      top.left == view.left
      top.right == view.right
      if #available(iOS 11.0, *) {
        top.bottom == view.safeAreaLayoutGuide.top + 60
      } else {
        top.height == 60
      }

      header.top == top.bottom
      header.left == view.left
      header.right == view.right

      table.top == top.bottom
      table.left == view.left
      table.bottom == view.bottom
      table.right == view.right
    }

    constrain(topView, nameLabel, logoutButton) { top, name, logout in
      name.left == top.left + 18
      name.bottom == top.bottom - 10

      logout.right == top.right - 18
      logout.centerY == name.centerY
    }

    constrain(
      headerView,
      accountLabel,
      accountValueLabel,
      balanceLabel,
      balanceValueLabel) { header, account, accountValue, balance, balanceValue in
        account.top == header.top + 10
        account.left == header.left + 18
        account.right == header.right - 18

        align(left: [account, accountValue, balance, balanceValue])
        align(right: [account, accountValue, balance, balanceValue])

        accountValue.top == account.bottom + 4
        balance.top == accountValue.bottom + 20
        balanceValue.top == balance.bottom + 4
        balanceValue.bottom == header.bottom - 18
    }
  }

  override func layoutIfNeeded() {
    super.layoutIfNeeded()
    tableView.contentInset = UIEdgeInsets(top: headerView.bounds.height, left: 0, bottom: 0, right: 0)
  }
}

// MARK: - Actions
@objc
extension AccountView {
  func logoutTapped() {
    viewLogic?.didTapLogout()
  }
}
