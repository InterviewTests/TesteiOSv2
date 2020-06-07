//
//  BalanceViewController.swift
//  UserInterface
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import UIKit
import Presenter
import Domain

public class BalanceViewController: CustomViewController {
    
    // MARK: - INTERNAL PROPERTIES
    
    // MARK: - PUBLIC PROPERTIES
    
    public weak var delegate: AppFlowControllerDelegate?
    
    // MARK: - CONSTANTS
    
    private struct Strings {
        static let recents = "Recents"
    }
    
    private struct Metrics {
        static let margin: CGFloat = 16
    }
    
    // MARK: - UI
    
    private lazy var indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.hidesWhenStopped = true
        return indicatorView
    }()
    
    private let alertController = AlertController()
    
    // MARK: - INITALIZER
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFE CYCLE
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    // MARK: - VIEW HIERARCHY
    
    public func subviews() {
        view.addSubview(indicatorView)
        
    }
    
    public func constraints() {
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }
    
    public func style() {
        view.backgroundColor = .white
    }
    
    // MARK: - PRIVATE FUNC
    
}
