//
//  CardView.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 19/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    override func layoutSubviews() {
        layer.cornerRadius = 10
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0);
        layer.shadowOpacity = 0.4
        layer.shadowPath = shadowPath.cgPath
    }
}

@IBDesignable
class CardViewRound: UIView {
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width/2
    }
}
