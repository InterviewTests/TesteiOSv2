//
//  ServiceAPI.swift
//  BankSantanderTata
//
//  Created by Wagner Rodrigues on 05/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import Alamofire

protocol ServiceAPIDelegate {
    func onSuccess(data:[String:Any])
    func onError(message:String)
}

class ApiService {
    
    let BASE_URL:String
    
    static let sharedInstance: ApiService = ApiService()
    private init() {
        BASE_URL = "https://bank-app-test.herokuapp.com"
        
    }
    
    func login(_ param: Parameters, _ callback: @escaping (DataResponse<Any>) -> Void)
    {
        send("\(BASE_URL)/api/login",.post,param,callback)
    }
    
    func statement(_ callback: @escaping (DataResponse<Any>) -> Void){
        send("\(BASE_URL)/api/statements/1",.get, [:], callback)
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Alamofire Helpers
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    private func send(_ url:String,_ verb:HTTPMethod,_ param:Parameters?,_ callback: @escaping (DataResponse<Any> ) -> Void) {
        Alamofire.request(URL(string:url)!,
                          method: verb,
                          parameters: param
                          //encoding: JSONEncoding.default,
            )
            .responseJSON(completionHandler: callback)
    }
    
    private func sendJson(_ url:String,_ verb:HTTPMethod,_ param:Parameters?,_ callback: @escaping (DataResponse<Any> ) -> Void) {
        Alamofire.request(URL(string:url)!,
                          method: verb,
                          parameters: param,
                          encoding: JSONEncoding.default)
            .responseJSON(completionHandler: callback)
    }
    
    
    private func get(_ url:String,_ callback: @escaping (DataResponse<Any> ) -> Void) {
        Alamofire.request(URL(string:url)!,
                          method: .get,
                          encoding: JSONEncoding.default)
            .responseJSON(completionHandler: callback)
    }
    
    
    
}
