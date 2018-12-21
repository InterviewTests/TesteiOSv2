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
            fillData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fillData(){
        self.title.text = data.title
        self.desc.text  = data.desc
        self.date.text  = data.date
        self.value.text = String(data.value)
    }

}
