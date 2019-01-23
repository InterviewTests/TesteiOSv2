//
//  statementsPresenter.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 21/01/19.
//  Copyright (c) 2019 ti alto nivel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol statementsPresentationLogic
{
  func presentSomething(response: statements.Something.Response)
}

class statementsPresenter: statementsPresentationLogic
{
  weak var viewController: statementsDisplayLogic?
    weak var repository: UserRepository?
  
  // MARK: Do something
  
  func presentSomething(response: statements.Something.Response)
  {
    let viewModel = statements.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
