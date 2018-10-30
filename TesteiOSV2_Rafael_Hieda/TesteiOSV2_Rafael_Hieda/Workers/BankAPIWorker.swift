//
//  BankAPIWorker.swift
//  TesteiOSV2_Rafael_Hieda
//
//  Created by Rafael  Hieda on 10/28/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

protocol BankWorkerDataProtocol
{
    var baseUrl : String {get set}
    func login(_ userLogin : UserLogin, completionHandler : @escaping (UserResponse) -> Void)
    func getAccountBalance(_ userResponse : UserResponse, completionHandler : @escaping(AccountBalance) -> Void) -> Void
}

class BankAPIWorker: BankWorkerDataProtocol {

    var baseUrl: String
    
    init()
    {
        //TODO: Include in plist
        self.baseUrl = "https://bank-app-test.herokuapp.com/api/"
    }
    
    func login(_ userLogin: UserLogin, completionHandler : @escaping (UserResponse) -> Void ) -> Void {
        
        let url: String = baseUrl.description + "login"
        
        let parameters : Parameters = ["user" : userLogin.login, "password" : userLogin.password]
        
        var userResponse: UserResponse?

        Alamofire.request(url, method: .post, parameters: parameters).validate().responseObject { (response: DataResponse<UserResponse>) in

            switch response.result
            {
                case .success:
                    userResponse = response.result.value
                    completionHandler(userResponse!)
                
                case .failure(_): break

            }
 
        }
    }
    
    func getAccountBalance(_ userResponse: UserResponse, completionHandler: @escaping(AccountBalance) -> Void) -> Void
    {
        var balanceAccount : AccountBalance?
        
        if userResponse.error?.Success() == true
        {
            let url: String = baseUrl.description + "statements/\(String(describing: userResponse.userAccount?.userId))"
            
            Alamofire.request(url)
                .responseObject {
                    (dataResponse : DataResponse<AccountBalance>) in
                    balanceAccount = dataResponse.result.value
            }
        }
    }
    
    
}
