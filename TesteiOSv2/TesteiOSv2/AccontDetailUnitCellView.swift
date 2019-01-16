//
//  AccontDetailUnitCell.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit
import SnapKit

class AccontDetailUnitCellView : UIView {
    /**
     StackView for this view labels.
     */
    lazy var upperViewConteiner : UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        return stackView
    }()
    
    lazy var downViewConteiner : UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        return stackView
    }()
    
    lazy var viewConteiner : UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        return stackView
    }()
    
    lazy var tittle : UILabel = {
        let tittle = UILabel()
        tittle.font = UIFont.boldSystemFont(ofSize: 16)
        tittle.numberOfLines = 0
        tittle.textAlignment = .center
        tittle.translatesAutoresizingMaskIntoConstraints = false
        return tittle
    }()
    
    lazy var descriptionAccount : UILabel = {
        let descriptionAccount = UILabel()
        descriptionAccount.font = UIFont.boldSystemFont(ofSize: 16)
        descriptionAccount.numberOfLines = 0
        descriptionAccount.textAlignment = .center
        descriptionAccount.translatesAutoresizingMaskIntoConstraints = false
        return descriptionAccount
    }()
    
    /**
     This view's data label for the movie.
     */
    lazy var dataLabel : UILabel = {
        let dataLabel = UILabel()
        dataLabel.font = UIFont.boldSystemFont(ofSize: 14)
        dataLabel.numberOfLines = 0
        dataLabel.textAlignment = .center
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        return dataLabel
    }()
    
    lazy var value : UILabel = {
        let value = UILabel()
        value.font = UIFont.boldSystemFont(ofSize: 16)
        value.numberOfLines = 0
        value.textAlignment = .center
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AccontDetailUnitCellView : ViewCode{
    func buildViewHierarchy() {
        
        upperViewConteiner.addArrangedSubview(tittle)
        upperViewConteiner.addArrangedSubview(dataLabel)
        downViewConteiner.addArrangedSubview(descriptionAccount)
        downViewConteiner.addArrangedSubview(value)
        viewConteiner.addArrangedSubview(upperViewConteiner)
        viewConteiner.addArrangedSubview(downViewConteiner)
        self.addSubview(viewConteiner)
    }
    
    func setupConstraints() {
        
        self.viewConteiner.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().inset(32)
            make.top.equalToSuperview().offset(18)
        }
    }
    
    func setupAdditionalConfigurations() {

    }
    
    
    
}
