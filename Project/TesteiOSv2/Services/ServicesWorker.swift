//
//  ServicesWorker.swift
//  TesteiOSv2
//
//  Created by Macintosh on 15/11/18.
//  Copyright © 2018 Roney Sampaio. All rights reserved.
//

import Foundation
import Alamofire



protocol ServicesProtocol
{
    func returnRequest(data: [String: Any])
    func returnError(errorMsg: String)
}



class ServicesWorker
{
    
    var services: ServicesProtocol?
    
    init(services: ServicesProtocol) {
        self.services = services
    }
    
    
    
    // MARK: Login Call
    func callLogin(userID: String, password: String) {
        let parameters: Parameters = [
            Global.RestParams.LoginRequest.kUser.rawValue: userID,
            Global.RestParams.LoginRequest.kPassword.rawValue: password
        ]
        
        let url: String = Global.RestAPI.baseURL.rawValue + Global.RestAPI.requestLogin.rawValue
        makeCall(url: url, method: HTTPMethod.post, parameters: parameters)
    }
    
    
    
    //MARK: Statements Call
    func fetchStatements(userID: Int) {
        
        let url: String = Global.RestAPI.baseURL.rawValue + Global.RestAPI.requestStatements.rawValue + String(userID)
        makeCall(url: url, method: HTTPMethod.get, parameters: [:])
    }
    
    
    
    //MARK: API Default Call
    func makeCall(url: String, method: HTTPMethod, parameters: Parameters) {
        
        Alamofire.request(url, method: method, parameters: parameters).responseJSON { response in
            
            switch (response.result) {
                
            case .success:
                
                if let resultJSON = response.result.value as? [String: Any] {
                    print("Response --> \(resultJSON)")
                    self.services?.returnRequest(data: resultJSON)
                } else {
                    self.services?.returnError(errorMsg: "defaultConnectionError".localized)
                }
                break
                
                
            case .failure ( _):
                self.services?.returnError(errorMsg: "defaultConnectionError".localized)
                break
            }
        }
    }
}
