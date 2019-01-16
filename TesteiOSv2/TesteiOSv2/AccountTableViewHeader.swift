//
//  AccountTableViewHeader.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 16/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit

class AccountTableViewHeader : UIView{
    
    lazy var tittle : UILabel = {
        let tittle = UILabel()
        tittle.font = UIFont.boldSystemFont(ofSize: 17)
        tittle.numberOfLines = 0
        tittle.text = ACCOUNT_TABLEVIEW_HEADER_TITTLE
        tittle.textAlignment = .center
        tittle.translatesAutoresizingMaskIntoConstraints = false
        return tittle
    }()
}
extension AccountTableViewHeader : ViewCode{
    func buildViewHierarchy() {
        self.addSubview(tittle)
    }
    
    func setupConstraints() {
        self.tittle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.left.equalToSuperview().offset(18)
            make.bottom.equalToSuperview().inset(8)
        }
    }
    
    func setupAdditionalConfigurations() {
     self.backgroundColor = UIColor.red
    }
    
    
}
