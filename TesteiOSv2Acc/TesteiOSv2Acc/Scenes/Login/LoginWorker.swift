//
//  LoginWorker.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 21/05/19.
//  Copyright (c) 2019 Marlon Santos Heitor. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

class LoginWorker
{
    var loginRestService: RestService<LoginResponse>?
    
    // MARK: - Initialization
    
    required init(){
        loginRestService = RestService<LoginResponse>()
    }
    
    // MARK: - Services
    
    func doLoginRequest(user: String, password: String, completion: @escaping (UserAccount?, ServiceError?) -> Void)
    {
        
        let serviceRequest = ServiceRequest.requestForLogin(user: user, password: password)
        loginRestService?.executeServiceRequest(serviceRequest: serviceRequest)
        { (loginResponse, requestError) in
            
            if loginResponse?.error?.code != nil{
                completion(nil, loginResponse?.error)
            }else{
                self.saveUserToKeychain(user: user)
                completion(loginResponse?.userAccount, nil)
            }
            
        }
        
    }
    
    func cancelLoginRequest(){
        loginRestService?.cancelCurrentRequest()
    }
    
    func saveUserToKeychain(user: String){
        KeychainManager(service: .userSafeStore).save(value: user, key: .user)
    }
    
    func retrieveUserFromKeychain() -> String?{
        return KeychainManager(service: .userSafeStore).retrieveString(key: .user)
    }
    
}
