//
//  classPasswordViewModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 01/04/21.
//

import Foundation
import RxSwift
import RxRelay

class PasswordModel : ValidationModel
{
      var errorMessage: String = LoginError.PasswordFail.rawValue
      
      var data: BehaviorRelay<String> = BehaviorRelay(value: "")
      var errorValue: BehaviorRelay<String?> = BehaviorRelay(value: "")
      
      func validateData() -> Bool
      {
            if Regex.isAcceptablePassword( data.value )
            {
                  errorValue.accept( "" )
                  
                  return true
            }
            else
            {
                  errorValue.accept( errorMessage )
                  
                  return false
            }
      }
}
