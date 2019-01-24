//
//  StatmentViewCell.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 23/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import UIKit

class StatmentViewCell: UITableViewCell {
    @IBOutlet var title: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var desc: UILabel!
    @IBOutlet var value: UILabel!

    func SetStatment(statment: Statment) {
        title.text = statment.title
        date.text = statment.date
        desc.text = statment.desc
        value.text = statment.value
    }
}
