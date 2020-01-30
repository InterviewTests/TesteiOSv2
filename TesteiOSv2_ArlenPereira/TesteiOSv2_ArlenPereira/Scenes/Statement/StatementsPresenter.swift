//
//  StatementPresenter.swift
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

protocol StatementsPresentationLogic
{
    func presentUserInfo(response: StatementsModel.UserInfoModel.Response)
    func presentStatements(response: StatementsModel.StatementsRequestModel.Response)
}

class StatementsPresenter: StatementsPresentationLogic
{
    
    
  weak var viewController: StatementDisplayLogic?
  
  // MARK: Function
  
    func presentUserInfo(response: StatementsModel.UserInfoModel.Response)
    {
        var dataResult: StatementsModel.UserInfoModel.ViewModel!

        if !response.userInfoResponse.data!.isEmpty {
            for item in response.userInfoResponse.data! {
                dataResult = StatementsModel.UserInfoModel.ViewModel(userId: item.userId,
                                                                     name: item.name,
                                                                     bankAccount: item.bankAccount,
                                                                     agency: item.agency,
                                                                     balance: item.balance)
            }
        }
        viewController?.displayUserInfo(viewModel: dataResult)
    }
    
    func presentStatements(response: StatementsModel.StatementsRequestModel.Response) {
        
        var dataResult: [StatementsModel.StatementsRequestModel.ViewModel.DisplayStatements] = []
        var codeResult: String = ""
        var msgResult: String = ""
        
        if response.statementsResponse.data != nil {
            let statementList = response.statementsResponse.data?.statementList
            if !(statementList!.isEmpty) {
                for item in statementList! {
                    for (_, value) in item {
                        
                        let statementsTitle = value["title"].stringValue
                        let statementsDesc = value["desc"].stringValue
                        let statementsDate = value["date"].stringValue
                        let statementsValue = value["value"].doubleValue
                        
                        dataResult.append(StatementsModel.StatementsRequestModel.ViewModel.DisplayStatements(title: statementsTitle,
                                                                                                             desc: statementsDesc,
                                                                                                             date: statementsDate,
                                                                                                             value: statementsValue))
                    }
                }
            }
        }
        
        if response.statementsResponse.code != nil || response.statementsResponse.message != nil {
            codeResult = response.statementsResponse.code!
            msgResult = response.statementsResponse.message!

            switch codeResult {
            case "-1003":
                msgResult = "Não foi possivel conectar com o servidor, tente mais tarde..."
                break

            default:
                break
            }
        }

        let viewModel = StatementsModel.StatementsRequestModel.ViewModel(data: dataResult, message: msgResult, code: codeResult)
        viewController?.displayStatements(viewModel: viewModel)
    }
}
