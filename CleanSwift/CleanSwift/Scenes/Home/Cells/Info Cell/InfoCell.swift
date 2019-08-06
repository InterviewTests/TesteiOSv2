//
//  InfoCell.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

class InfoCell: UITableViewCell {
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var lightLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure() {
        infoView.addShadowInView()
    }
}
