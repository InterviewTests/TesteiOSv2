//
//  StatementsCell.swift
//  TesteiOSv2
//
//  Created by Silva, Alex Nunes da on 14/01/2019.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import UIKit


class StatementsCell: UITableViewCell {

    @IBOutlet private weak var titleLabel : UILabel!
    @IBOutlet private weak var dateLabel : UILabel!
    @IBOutlet private weak var descricaoLabel : UILabel!
    @IBOutlet private weak var valueLabel : UILabel!
    @IBOutlet weak var containerView: UIView!

//    var statements : StatementList? = nil

    override func awakeFromNib() {
        super .awakeFromNib()
        setUpLayout()
    }

    func setUpStatements(statements : StatementList){
        titleLabel.text = statements.title
        descricaoLabel.text = statements.desc
        dateLabel.text = statements.date
        valueLabel.text = statements.value?.description
    }

    func setUpLayout(){
        self.containerView.addRadius()
        self.containerView.addShadowTable()
        self.containerView.clipsToBounds = false
    }
}
