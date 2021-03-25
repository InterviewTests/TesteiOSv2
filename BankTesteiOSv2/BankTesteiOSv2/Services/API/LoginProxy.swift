//
//  GetProxy.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation
import Alamofire

class LoginProxy
{
      
      static func loginAction(_ user: String,_ password: String, completion: @escaping (_ success: Bool,_ userLogin: UserRoot?) -> ())
      {
            let urlPath = "Login"
            
            let headers : HTTPHeaders =
            [
                "Content-Type": "application/x-www-form-urlencoded"
            ]
            
            let parameters : Parameters = [
                  "user": user,
                  "password": password
            ]
                
            AF.request(FullURLProxy.fullURLproxy(urlPath), method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers)
                  .responseJSON
            {response in
                  switch(response.result)
                  {
                  case.success(_):
                              let jsonData = response.data
                              do
                              {
                                    let userLogin = try JSONDecoder().decode(UserRoot.self, from: jsonData!)

                                    completion(true, userLogin)
                              }
                              catch
                              {
                                    completion(false, nil)
                              }
                              
                  case.failure(_):
                              completion(false, nil)
                   }
            }
      }
            
}
