//
//  AccountDetailsPresenter.swift
//  TesteiOSv2
//
//  Created by Voll Transportes on 15/11/18.
//  Copyright (c) 2018 Roney Sampaio. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AccountDetailsPresentationLogic
{
  func presentSomething(response: AccountDetails.Something.Response)
}

class AccountDetailsPresenter: AccountDetailsPresentationLogic
{
  weak var viewController: AccountDetailsDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: AccountDetails.Something.Response)
  {
    let viewModel = AccountDetails.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
