//
//  RegistryTableViewCell.swift
//  TesteiOSV2_Rafael_Hieda
//
//  Created by Rafael  Hieda on 10/29/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import UIKit

class RegistryTableViewCell: UITableViewCell {

    @IBOutlet weak var cellInternalView: UIView!
    @IBOutlet weak var dataTextField: UILabel!
    @IBOutlet weak var pagamentoTextField: UILabel!
    @IBOutlet weak var descricaoTextField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cellInternalView.layer.cornerRadius = 6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
