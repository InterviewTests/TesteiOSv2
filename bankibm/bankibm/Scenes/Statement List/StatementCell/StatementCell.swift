//
//  StatementCell.swift
//  bankibm
//
//  Created by Alexandre Furquim on 03/11/18.
//  Copyright © 2018 Alexandre Furquim. All rights reserved.
//

import UIKit

class StatementCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    
    @IBOutlet weak var viewBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var displayedRegister: StatementList.DisplayedRegister?
    {
        didSet
        {
            lblTitle.text = displayedRegister?.title
            lblDesc.text = displayedRegister?.desc
            lblDate.text = displayedRegister?.date
            lblValue.text = displayedRegister?.value
                        
        }
    }
    
    func updateLayout() {
        
        viewBackground.layer.masksToBounds = true
        viewBackground.layer.cornerRadius = 2
        viewBackground.backgroundColor = ToolBox.Graphic.colorWithHexString(string: "#FFFFFF")
        ToolBox.Graphic.applyShadow(view: viewBackground, color: UIColor.lightGray , offSet: CGSize(width:2, height:2), radius: 5.0, opacity: 0.5)
    }
}
