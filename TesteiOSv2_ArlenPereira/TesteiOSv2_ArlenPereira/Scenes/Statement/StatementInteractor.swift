//
//  StatementInteractor.swift
//  TesteiOSv2_ArlenPereira
//
//  Created by Arlen Ricardo Pereira on 28/01/20.
//  Copyright (c) 2020 Arlen Ricardo Pereira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol StatementBusinessLogic
{
  func requestUserInfo(request: StatementsModel.UserInfoModel.Request)
}

protocol StatementDataStore
{
  var userInfo: LoginAPIModel? { get set }
}

class StatementInteractor: StatementBusinessLogic, StatementDataStore
{

    var presenter: StatementsPresentationLogic?
    var worker: StatementWorker?
    var userInfo: LoginAPIModel?
  
  // MARK: Do something
  
  func requestUserInfo(request: StatementsModel.UserInfoModel.Request)
  {
    
    let response = StatementsModel.UserInfoModel.Response(userInfoResponse: userInfo!)
    presenter?.presentUserInfo(response: response)
  }
}
