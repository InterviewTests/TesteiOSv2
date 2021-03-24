//
//  StatementProxy.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation
import Alamofire

class StatementProxy
{
      
      static func getStatementAction(_ userId: String, completion: @escaping (_ success: Bool,_ userStatementList: UserRootStatement?) -> ())
      {
            let urlPath = "Statements/\(userId)"
            
            let headers : HTTPHeaders =
            [
                "Content-Type": "application/x-www-form-urlencoded"
            ]
                
            AF.request(FullURLProxy.fullURLproxy(urlPath), method: .get, parameters: nil, encoding: URLEncoding.httpBody, headers: headers)
                  .responseJSON
            {response in
                  switch(response.result)
                  {
                        case.success(let data):
                              let jsonData = response.data
                              do
                              {
                                    let userStatementList = try JSONDecoder().decode(UserRootStatement.self, from: jsonData!)

                                    completion(true, userStatementList)
                              }
                              catch
                              {
                                    completion(false, nil)
                              }
                              
                        case.failure(let _):
                              completion(false, nil)
                   }
            }
      }
            
}


