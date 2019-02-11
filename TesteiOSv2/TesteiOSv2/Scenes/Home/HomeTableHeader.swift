//
//  HomeTableHeader.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 08/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import UIKit

protocol HomeTableHeaderProtocol {
   func didLogOut()
}

class HomeTableHeader: UIView {
    
    var delagete: HomeTableHeaderProtocol?

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBAction func didTouchLogOutButton(_ sender: Any) {
        if let delegate = self.delagete{
            delegate.didLogOut()
        }
    }
}
