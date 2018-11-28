//
//  PaymentTableHeader.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 26/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit

class PaymentTableHeader: UIView {

    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblAccountNumber : UILabel!
    @IBOutlet weak var lblBalance : UILabel!
    var didTapLogout: (() -> Void)?
    
    
    @IBAction func doLogout(_ sender: Any) {
        
        self.didTapLogout?()
        
    }
    
    func loadViewFromNib(_ tapLogout:(() -> Void)?, userAccount:Account) -> PaymentTableHeader {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! PaymentTableHeader
        nibView.didTapLogout = tapLogout
        nibView.lblName.text = userAccount.name
        nibView.lblBalance.text = String(format: "R$ %.2f", userAccount.balance).replacingOccurrences(of: ".", with: ",")
        nibView.lblAccountNumber.text = userAccount.agencyConta
        return nibView
    }
    
//    func loadViewFromNib() -> UIView {
//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
//        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
//        return nibView
//    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
