//
//  UserService.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire
import ObjectMapper

class UserService: NSObject {
    class func authLogin(user: String,pass:String) ->  RxSwift.Observable<User> {
        
        let parameters = ["user":user,"password":pass]
        let url = Routes.login
        
        return RxSwift.Observable<User>.create({ (observer) -> Disposable in
            ServiceManager.defaultClient.request(url,method: .post,
                                          parameters: parameters,
                                          encoding:JSONEncoding(),
                                          headers:nil)
                .validate(statusCode: 200...399)
                .responseJSON(completionHandler: { (response) in
                   
                    let error = self.getError(fromRequest: response)
                    
                    if error.hasError {
                        let errorMsg = error.messageError ?? "Server error"
                        observer.onError(NSError(domain: "br.com.testeiOS", code: 40, userInfo: ["error": errorMsg]))
                    } else {
                        
                        if let dic = response.value as? [String: Any] {
                                if let dicUserAccount = dic["userAccount"] as? [String: Any] {
                                    if let user = Mapper<User>().map(JSON: dicUserAccount) {
                                       observer.onNext(user)
                                    } else {
                                        observer.onError(NSError(domain: "br.com.testeiOS", code:500, userInfo: ["message": "Erro a carregar informações do usuario."]))
                                    }
                                }
                                observer.onCompleted()
                            
                        } else {
                            observer.onError(NSError(domain: "br.com.testeiOS", code:500, userInfo: ["message": "Erro a carregar informações do usuario."]))
                             observer.onCompleted()
                        }
                    }
                    return observer.onCompleted()
                })
            
            return Disposables.create()
        })
    }
    static func getError(fromRequest dataResponse: DataResponse<Any>) -> (hasError: Bool, messageError: String?) {
        
        var messageError: String? = nil
        
        var hasError: Bool = false
        
        if let statusCode = dataResponse.response?.statusCode {
            if statusCode >= 300 && statusCode <= 400 {
                if let errorData = dataResponse.data {
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: errorData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
                        hasError = true
                        guard let  message = json["error"] else {return (true,"Error na solicitação") }
                        
                        messageError = message as? String
                        
                    } catch {
                        hasError = false
                    }
                }
            }
        }
        
        return (hasError, messageError)
    }
    
}
