//
//  GetProxy.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation
import RxAlamofire

class LoginProxy
{
      
      static func loginUserAction(_ user: String,_ password: String, completion: @escaping (_ success: Bool,_ userLogin: UserRoot?) -> ())
      {
            let urlPath = "Login"
            
            let parameters = [
                  "user": user,
                  "password": password
            ]
            
            let fullPath = FullURLProxy.fullURLproxy(urlPath)
            
            _ = RxAlamofire.data(.post, fullPath, parameters: parameters)
                  .subscribe(onNext: { ( responseData  ) in
                        do
                        {
                              let userLogin = try JSONDecoder().decode(UserRoot.self, from: responseData)

                              completion(true, userLogin)
                        }
                        catch
                        {
                              completion(false, nil)
                        }
                  }, onError: { ( errorData ) in
                        completion(false, nil)
                  })
      }
            
}
