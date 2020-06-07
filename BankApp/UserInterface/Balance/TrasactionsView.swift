//
//  TrasactionsView.swift
//  UserInterface
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import UIKit

public class TrasactionsView: UIView {
    
    // MARK: - PUBLIC PROPERTIES
    
    // MARK: - CONSTANTS
    
    private struct Metrics {
        static let heightCell: CGFloat = 80
    }
    
    private struct Strings {
        static let titleHeader = "Recentes"
        static let balance = "Saldo"
    }
    
    // MARK: - UI

    
    // MARK: - INITALIZER
    
    public init() {
        super.init(frame: .zero)
        subviews()
        constraints()
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - VIEW HIERARCHY
    
    public func subviews() {
 
    }
    
    public func constraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    public func style() {
        backgroundColor = .init(red: 0.23, green: 0.20, blue: 0.93, alpha: 1.0)
    }
    
    // MARK: - PRIVATE FUNC
}
