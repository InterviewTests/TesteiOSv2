//
//  RegisterCell.swift
//  TesteiOSv2
//
//  Created by Alexandre Gabassi on 30/10/18.
//  Copyright © 2018 Alexandre Gabassi. All rights reserved.
//

import UIKit

//class RegisterCell: UITableViewCell {
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//}

class RegisterCell: UITableViewCell
{
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var value: UILabel!

    var displayedRegister: Home.DisplayedRegister?
    {
        didSet
        {
            title.text = displayedRegister?.title
            desc.text = displayedRegister?.desc
            date.text = displayedRegister?.date
            value.text = displayedRegister?.value
        }
    }
}

