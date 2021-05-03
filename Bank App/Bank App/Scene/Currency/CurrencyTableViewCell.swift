//
//  CurrencyTableViewCell.swift
//  Bank App
//
//  Created by Christian Castro on 02/05/21.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    static let identifier = "CurrencyTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    private func setupView() {
        dataView.layer.cornerRadius = 10
        dataView.layer.shadowColor = UIColor.black.cgColor
        dataView.layer.shadowOpacity = 0.3
        dataView.layer.shadowOffset = .zero
        dataView.layer.shadowRadius = 10
        dataView.layer.shouldRasterize = true
        dataView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func configureCell(user data: CurrencyByUser) {
        kindLabel.text = data.type
        descriptionLabel.text = data.description
        dateLabel.text = data.date
        valueLabel.text = data.value
    }
    
}
