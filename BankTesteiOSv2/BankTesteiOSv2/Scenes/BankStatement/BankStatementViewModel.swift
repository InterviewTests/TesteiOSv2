//
//  BankStatementViewModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 02/04/21.
//

import Foundation
import RxRelay

class BankStatementViewModel
{
      let isLoading : BehaviorRelay<Bool> = BehaviorRelay(value: false)
      let isSuccess : BehaviorRelay<Bool> = BehaviorRelay(value: false)
      let errorMsg : BehaviorRelay<String> = BehaviorRelay(value: "")
            
      func getBankStatementData(_ userId : String)
      {
            self.isLoading.accept( true )

            StatementProxy.getStatementAction( userId )
            { (success, userStatementList) in
                  if success
                  {
                        userWSStatementList = userStatementList
                        userWSStatementListCount = (userWSStatementList?.statementList.count)!
                                                                                                
                        self.isLoading.accept( false )
                        self.isSuccess.accept( true )
                        self.errorMsg.accept( "" )
                  }
                  else
                  {
                        self.isLoading.accept( false )
                        self.isSuccess.accept( false )
                        self.errorMsg.accept( LoginError.AllDataFail.rawValue )
                  }
            }
      }
}
