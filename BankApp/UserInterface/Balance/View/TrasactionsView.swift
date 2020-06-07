//
//  TrasactionsView.swift
//  UserInterface
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import UIKit

public class TrasactionsView: UIView {
    
    // MARK: - INTERNAL PROPERTIES
    
    internal let identifierCell = String(describing: TransactionCustomCell.self)
    
    // MARK: - CONSTANTS
    
    private struct Metrics {
        static let heightCell: CGFloat = 80
    }
    
    private struct Strings {
        static let titleHeader = "Recentes"
    }
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.bounces = false
        tableView.register(TransactionCustomCell.self, forCellReuseIdentifier: identifierCell)
        return tableView
    }()
    
    // MARK: - INITALIZER
    
    public init() {
        super.init(frame: .zero)
        subviews()
        constraints()
        style()
        setupDataSource()
        let range = Range(1...100)
        
        applySnapshot(trasactions: range.map { return $0 })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - VIEW HIERARCHY
    
    public func subviews() {
        addSubview(tableView)
    }
    
    public func constraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func style() {
        backgroundColor = .white
    }
    
    // MARK: - DATASOURCE
    
    private enum Section {
        case main
    }
    
    private typealias DataSource = UITableViewDiffableDataSource<Section, Int>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Int>
    
    private var dataSource: DataSource! = nil
    
    private func setupDataSource() {
        dataSource = DataSource(tableView: tableView, cellProvider: { (tableView, indexPath, value) -> UITableViewCell? in
            let cellOptional = tableView.dequeueReusableCell(withIdentifier: self.identifierCell, for: indexPath) as? TransactionCustomCell
            guard let cell = cellOptional else { return .init() }
            return cell
        })
    }
    
    // MARK: - PUBLIC FUNC
    
    public func applySnapshot(trasactions: [Int]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(trasactions)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    // MARK: - PRIVATE FUNC
}
