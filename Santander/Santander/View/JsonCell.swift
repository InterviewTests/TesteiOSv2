//
//  JsonCell.swift
//  Santander
//
//  Created by ely.assumpcao.ndiaye on 09/01/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

class JsonCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var value: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 4
            frame.size.height -= 2 * 4
            super.frame = frame
        }
    }
    
    
    func configureCell(statement: StatementList){
        let titleByStatement = statement.title ?? ""
        title.text = titleByStatement
        
        let descByStatement = statement.desc ?? ""
        desc.text = descByStatement
        
        let dateByStatement = statement.date ?? ""
        data.text = dateByStatement
        
        let valueByStatement = statement.value ?? ""
        value.text = "R$ \(valueByStatement)"
        
    }//func configureCell
    

}
