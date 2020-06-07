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
        static let heightMultiplierAccountView: CGFloat = 0.4
    }
    
    // MARK: - UI
    
    private lazy var accountView: AccountView = {
        let view = AccountView(delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var trasactionsView: TrasactionsView = {
        let view = TrasactionsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let range = Range(1...30)
        view.applySnapshot(trasactions: range.map { return $0 })
        return view
    }()
    
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
        view.addSubview(accountView)
        view.addSubview(trasactionsView)
        view.addSubview(indicatorView)
        
    }
    
    public func constraints() {
        NSLayoutConstraint.activate([
            accountView.topAnchor.constraint(equalTo: view.topAnchor),
            accountView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            accountView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            accountView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: Metrics.heightMultiplierAccountView),
            
            trasactionsView.topAnchor.constraint(equalTo: accountView.bottomAnchor),
            trasactionsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trasactionsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            trasactionsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            indicatorView.centerXAnchor.constraint(equalTo: trasactionsView.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: trasactionsView.centerYAnchor),
        ])
    }
    
    public func style() {
        view.backgroundColor = .white
    }
    
    // MARK: - PRIVATE FUNC
    
}

extension BalanceViewController: AccountViewDelegate {
    public func didTapLogoutButon() {
        dismiss(animated: true) {
            //TODO: Remove data from user
        }
    }
}
