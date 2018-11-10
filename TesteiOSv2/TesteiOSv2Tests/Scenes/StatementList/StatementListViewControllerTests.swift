//
//  StatementListViewControllerTests.swift
//  TesteiOSv2
//
//  Created by Bruno on 09/11/18.
//  Copyright (c) 2018 Bruno Scheltzke. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import TesteiOSv2
import XCTest

class StatementListViewControllerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: StatementListViewController!
  var window: UIWindow!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    window = UIWindow()
    setupStatementListViewController()
  }
  
  override func tearDown()
  {
    window = nil
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupStatementListViewController()
  {
    let bundle = Bundle.main
    let storyboard = UIStoryboard(name: "Main", bundle: bundle)
    sut = storyboard.instantiateViewController(withIdentifier: "StatementListViewController") as! StatementListViewController
  }
  
  func loadView()
  {
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  
  // MARK: Test doubles
  
  class StatementListBusinessLogicSpy: StatementListBusinessLogic
  {
    var doSomethingCalled = false
    
    func doSomething(request: StatementList.Something.Request)
    {
      doSomethingCalled = true
    }
  }
  
  // MARK: Tests
}
