//
//  DefaultUIButton.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 17/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import UIKit

final class DefaultButton: UIButton {

    // MARK: - Constants

    private let fontSize = 16.0

    // MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Setup

    private func setup() {
        layer.cornerRadius = 4
        titleLabel?.font = .bankFont?.withSize(fontSize)
        setTitleColor(.white, for: .normal)
        setTitleColor(.white, for: .highlighted)
        backgroundColor = .bankPrimary
        shadow()
    }

    private func shadow() {
        layer.shadowColor = UIColor.bankPrimary.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.3
    }

    override var isHighlighted: Bool {
        didSet {
            guard  let backgroundColor = backgroundColor else { return }
            self.backgroundColor =
            isHighlighted ?  backgroundColor.withAlphaComponent(0.5) : backgroundColor.withAlphaComponent(1)
        }
    }
}
