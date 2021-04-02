//
//  classEmailOrCPFViewModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 01/04/21.
//

import Foundation
import RxRelay

class EmailOrCPFModel : ValidationModel
{
      var errorMessage: String = LoginError.EmailFail.rawValue
      
      var data: BehaviorRelay<String> = BehaviorRelay(value: "")
      var errorValue: BehaviorRelay<String?> = BehaviorRelay(value: "")
      
      func validateData() -> Bool
      {
            let emailOrCPF = data.value

            if emailOrCPF.contains("@")
            {
                  guard Regex.isRealEmail( emailOrCPF )
                  else
                  {
                        errorMessage = LoginError.EmailFail.rawValue
                        errorValue.accept( errorMessage )
                        
                        return false
                  }
                  
                  errorValue.accept(  "" )
                  
                  return true
            }
            else if( emailOrCPF.count == 11 )
            {
                  guard emailOrCPF.isRealCPF
                  else
                  {
                        errorMessage = LoginError.CPFFail.rawValue
                        errorValue.accept( errorMessage )
                        
                        return false
                  }
                  
                  errorValue.accept(  "" )
                  
                  return true
            }
            else
            {
                  errorValue.accept( errorMessage )
                  
                  return false
            }
      }
}
