//
//  StatementsListInteractor.swift
//  Bank_App
//
//  Created by apple on 21/03/20.
//  Copyright (c) 2020 Barbara_Aniele. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol StatementsListBusinessLogic
{
  func doSomething(request: StatementsList.Request)
}

protocol StatementsListDataStore {
  var userInfo: UserAccount? { get set }
}

class StatementsListInteractor: StatementsListBusinessLogic, StatementsListDataStore
{
  var presenter: StatementsListPresentationLogic?
  var worker: StatementsListWorker?
  
  var userInfo: UserAccount?
  
  // MARK: Do something
  
  func doSomething(request: StatementsList.Request)
  {
    worker = StatementsListWorker()
    worker?.doSomeWork()
    
    let response = StatementsList.Response()
    presenter?.presentSomething(response: response)
  }
}
