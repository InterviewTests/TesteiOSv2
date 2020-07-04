//
//  PaymentsTableViewCell.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

class PaymentsTableViewCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        return UIView(frame: .zero)
    }()
    
    private lazy var paymentFixedLbl: UILabel = {
        return UILabel(frame: .zero)
    }()
    
    private lazy var paymentLbl: UILabel = {
        return UILabel(frame: .zero)
    }()
    
    private lazy var dateLbl: UILabel = {
        return UILabel(frame: .zero)
    }()
    
    private lazy var valueLbl: UILabel = {
        return UILabel(frame: .zero)
    }()
    
    private var viewModel: Payments.Info.ViewModel.Payment?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: Payments.Info.ViewModel.Payment) {
        self.viewModel = viewModel
        applyViewCode()
    }
}

extension PaymentsTableViewCell: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        containerView.addSubview(paymentFixedLbl)
        containerView.addSubview(paymentLbl)
        containerView.addSubview(dateLbl)
        containerView.addSubview(valueLbl)
        addSubview(containerView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(80)
        }
        paymentFixedLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(19)
            make.left.equalToSuperview().inset(9)
            make.height.equalTo(18)
            make.width.equalTo(120)
        }
        paymentLbl.snp.makeConstraints { make in
            make.top.equalTo(paymentFixedLbl.snp.bottom).offset(19)
            make.left.equalToSuperview().inset(9)
            make.height.equalTo(18)
            make.width.equalTo(120)
        }
        dateLbl.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(19)
            make.height.equalTo(14)
            make.width.equalTo(117)
        }
        valueLbl.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(15)
            make.top.equalTo(dateLbl.snp.bottom).offset(14)
            make.height.equalTo(23)
            make.width.equalTo(184)
        }
    }
    
    func configureViews() {
        backgroundColor = Payments.Constants.Colors.backgroundColor
        
        containerView.backgroundColor = Payments.Constants.Colors.backgroundColor
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = Payments.Constants.Colors.cellLayerColor.cgColor
        containerView.layer.cornerRadius = 6
        
        paymentFixedLbl.textAlignment = .left
        paymentFixedLbl.text = Payments.Constants.Texts.paymentFixed
        paymentFixedLbl.font = Payments.Constants.Fonts.paymentFixed
        paymentFixedLbl.textColor = Payments.Constants.Colors.paymentFixedColor
        
        paymentLbl.textAlignment = .left
        paymentLbl.text = viewModel?.paymentInfo
        paymentLbl.font = Payments.Constants.Fonts.payment
        paymentLbl.textColor = Payments.Constants.Colors.paymentColor
        
        dateLbl.textAlignment = .right
        dateLbl.text = viewModel?.date
        dateLbl.font = Payments.Constants.Fonts.date
        dateLbl.textColor = Payments.Constants.Colors.dateColor
        
        valueLbl.textAlignment = .right
        valueLbl.text = viewModel?.value
        valueLbl.font = Payments.Constants.Fonts.value
        valueLbl.textColor = Payments.Constants.Colors.valueColor
    }
}
