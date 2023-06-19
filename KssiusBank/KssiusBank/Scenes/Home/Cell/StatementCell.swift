//
//  StatementCell.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 17/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import UIKit

// MARK: - Cell for statements

final class StatementCell: UITableViewCell {

    // MARK: - Properties

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

    // MARK: - Display Data

    func setup(model: Home.GetStatements.StatementViewModel) {
        cleanCells()
        typeLabel?.text = model.type
        dateLabel?.text = model.date
        descriptionLabel?.text = model.description
        balanceLabel?.text = model.value
    }

    private func cleanCells() {
        typeLabel?.text = ""
        dateLabel?.text = ""
        descriptionLabel?.text = ""
        balanceLabel?.text = ""
    }
}
