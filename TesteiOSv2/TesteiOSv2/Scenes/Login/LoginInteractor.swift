//
//  LoginInteractor.swift
//  TesteiOSv2
//
//  Created by Bruno on 09/11/18.
//  Copyright (c) 2018 Bruno Scheltzke. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginBusinessLogic
{
  func verifyExistingLoginInfo(request: Login.ExistingInfo.Request)
}

protocol LoginDataStore
{
  //var name: String { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
  var presenter: LoginPresentationLogic?
  var worker: LoginWorker
  //var name: String = ""
  
    init() {
        self.worker = LoginWorker(LocalStorageManager())
    }
    
  // MARK: Do something
  
  func verifyExistingLoginInfo(request: Login.ExistingInfo.Request)
  {
    let (userName, password) = worker.fetchExistingLoginInfo()
    let response = Login.ExistingInfo.Response(userName: userName, password: password)
    self.presenter?.presentExistentLoginInfo(response: response)
  }
}
