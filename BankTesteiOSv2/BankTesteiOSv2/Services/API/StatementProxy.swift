//
//  StatementProxy.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation
import RxAlamofire

class StatementProxy
{
      
      static func getStatementAction(_ userId: String, completion: @escaping (_ success: Bool,_ userStatementList: UserRootStatement?) -> ())
      {
            let urlPath = "Statements/\(userId)"
            
            let fullPath = FullURLProxy.fullURLproxy(urlPath)
            
            _ = RxAlamofire.data(.get, fullPath)
                  .subscribe(onNext: { ( responseData  ) in
                        do
                        {
                              let userStatementList = try JSONDecoder().decode(UserRootStatement.self, from: responseData)

                              completion(true, userStatementList)
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


