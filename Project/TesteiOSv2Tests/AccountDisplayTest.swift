//
//  AccountDisplayTest.swift
//  TesteiOSv2Tests
//
//  Created by Macintosh on 15/11/18.
//  Copyright © 2018 Roney Sampaio. All rights reserved.
//

import XCTest
@testable import TesteiOSv2
@testable import Alamofire


class AccountDisplayTest: XCTestCase {
    
    var accountDetailsVC: AccountDetailsViewController!
    
    
    override func setUp() {
        setupAccountDetailsViewController()
    }
    
    
    // MARK: Set up
    func setupAccountDetailsViewController()
    {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "AccountDetails", bundle: bundle)
        accountDetailsVC = storyboard.instantiateViewController(withIdentifier: "AccountDetails") as? AccountDetailsViewController
    }
    
    
    // MARK: Test Reloading Table
    func testShouldDisplayFetchedOrders()
    {
        // Given
        let tableViewSpy = TableViewSpy()
        accountDetailsVC.statementsTableView = tableViewSpy
        
        // When
        let statement1 = AccountDetails.StatementItem(date: "Date 1", description: "Test 1", title: "Title 1", value: "Value 1")
        let statement2 = AccountDetails.StatementItem(date: "Date 2", description: "Test 2", title: "Title 2", value: "Value 2")
        let statement3 = AccountDetails.StatementItem(date: "Date 3", description: "Test 3", title: "Title 3", value: "Value 3")
        let viewModel:[AccountDetails.StatementItem] = [statement1, statement2, statement3]
        accountDetailsVC.displayFetchedAccountData(statementItems: viewModel)
        
        // Then
        XCTAssert(tableViewSpy.reloadDataCalled, "Displaying fetched orders should reload the table view")
    }
    
    
    // MARK: Test Number of Rows
    func testNumberOfRowsInAnySectionShouldEqaulNumberOfOrdersToDisplay()
    {
        // Given
        let tableView = accountDetailsVC.statementsTableView
        let statement1 = AccountDetails.StatementItem(date: "Date 1", description: "Test 1", title: "Title 1", value: "Value 1")
        let statement2 = AccountDetails.StatementItem(date: "Date 2", description: "Test 2", title: "Title 2", value: "Value 2")
        let statement3 = AccountDetails.StatementItem(date: "Date 3", description: "Test 3", title: "Title 3", value: "Value 3")
        let viewModel:[AccountDetails.StatementItem] = [statement1, statement2, statement3]
        accountDetailsVC.displayFetchedAccountData(statementItems: viewModel)
        
        // When
        let numberOfRows = accountDetailsVC.tableView(tableView!, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(numberOfRows, viewModel.count, "The number of table view rows should equal the number of orders to display")
    }
    
    
    class TableViewSpy: UITableView
    {
        // MARK: Method call expectations
        
        var reloadDataCalled = false
        
        // MARK: Spied methods
        
        override func reloadData()
        {
            reloadDataCalled = true
        }
    }
    
    
    override func tearDown() {
        accountDetailsVC = nil
    }
    
}
