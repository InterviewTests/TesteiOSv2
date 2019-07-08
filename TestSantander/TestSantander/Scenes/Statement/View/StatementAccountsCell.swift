//
//  StatementAccountsCell.swift
//  TestSantander
//
//  Created by ely.assumpcao.ndiaye on 14/06/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

class StatementAccountsCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var valueLbl: UILabel!
    //    @IBOutlet weak var titleLbl: UILabel!
    //    @IBOutlet weak var descriptionLbl: UILabel!
    //    @IBOutlet weak var dateLbl: UILabel!
    //    @IBOutlet weak var valueLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.9568627451, green: 0.9647058824, blue: 0.968627451, alpha: 1)
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(statement: StatementList){
        //        let titleByStatement = statement.title ?? ""
        //        print("titile da ceell:\(titleByStatement)")
        //        titleLbl.text = titleByStatement
        //
        //        let descByStatement = statement.desc ?? ""
        //        descriptionLbl.text = descByStatement
        //
        //        let dateByStatement = statement.date ?? ""
        //        //Convert yy-MM-dd to dd/MM/yyyy
        //        let inputFormatter = DateFormatter()
        //        inputFormatter.dateFormat = "yyyy-MM-dd"
        //        let showDate = inputFormatter.date(from: dateByStatement)
        //        inputFormatter.dateFormat = "dd/MM/yyyy"
        //        let resultDateString = inputFormatter.string(from: showDate!)
        //
        //        dateLbl.text = resultDateString
        //        print(statement.date)
        //
        //        let valueByStatement = String(statement.value) ?? ""
        //        valueLbl.text = "R$ \(valueByStatement)"
        
    }//func configureCell
    
}

