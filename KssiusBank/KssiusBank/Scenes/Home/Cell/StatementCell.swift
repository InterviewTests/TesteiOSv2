//
//  StatementCell.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 17/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import UIKit

final class StatementCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView?
    @IBOutlet weak var typeLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var balanceLabel: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()

        mainView?.layer.shadowColor = UIColor.bankLightGray.withAlphaComponent(0.5).cgColor
        mainView?.layer.shadowOffset = CGSize(width: 0, height: 5)
        mainView?.layer.shadowOpacity = 0.5
        mainView?.layer.shadowRadius = 12

        mainView?.layer.cornerRadius = 6.0
    }

}
