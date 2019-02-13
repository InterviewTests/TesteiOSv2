//
//  StatementTableViewCell.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 08/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import UIKit

//MARK: - Class Body
class StatementTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var label_date: UILabel!
    @IBOutlet weak var label_type: UILabel!
    @IBOutlet weak var label_price: UILabel!
    @IBOutlet weak var view_container: UIView!
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.addShadow(color: .ShadowCellColor, opacity: 1.0, offSetWidth: 1, offSetHeight: 1, radius: 5)
        self.view_container.addBorder(radius: 6.0, color: .BorderCellColor)
    }
    
    //MARK: - Functions
    func populateFields(statement: StatementItem){
        self.selectionStyle = .none
        
        if let date = statement.date{
            if let stringDate = date.convertStringToDate(format: "YYY/MM/dd"){
                self.label_date.text = stringDate.convertDateToString(format: "dd/MM/YYYY")
            }
        }
        
        if let value = statement.value{
            self.label_price.text = value.convertCoin()
        }
        
        self.label_type.text = statement.title
    }
    
}
