//
//  AccontDetailTableCell.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit

class AccontDetailTableViewCell : UITableViewCell{
    
    
    
    lazy var accontDetailUnitCellView : AccontDetailUnitCellView = {
        let accontDetailUnitCellView = AccontDetailUnitCellView()
        return accontDetailUnitCellView
    }()
    
    func uploadView(with userAccount: UserAccount){
//        self.accontDetailUnitCellView.dataLabel.text = userAccount.
//        self.accontDetailUnitCellView.titleLabel.text = movieCell.title
//        self.accontDetailUnitCellView.posterImageView.kf.setImage(with:resource)
    }
}
extension AccontDetailTableViewCell : ViewCode{
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfigurations() {
        
    }
    
    
}
