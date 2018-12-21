//
//  DetailsTableViewCell.swift
//  TesteiOSSantander
//
//  Created by julio.c.tanchiva on 12/19/18.
//  Copyright © 2018 julio.c.tanchiva. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {


    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var value: UILabel!
    
    var data: statementList!{
        didSet{
            fillDate()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func fillDate(){
        self.title.text = data.title
        self.desc.text  = data.title
        self.date.text  = data.date
        self.value.text = data.date
    }

}
