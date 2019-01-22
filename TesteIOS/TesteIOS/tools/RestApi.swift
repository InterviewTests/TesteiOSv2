//
//  RestApi.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 22/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
            debugPrint("=======================================")
            debugPrint(self)
            debugPrint("=======================================")
        #endif
        return self
    }
}

class RestApi: RestApiProtocol {
    public static func doLogin(user: String, password: String, callback: @escaping (_ userAccount: UserAccount?) -> Void) {
        let url = Constants.BASEURL + "/login"
        Alamofire.request(url, method: .post, parameters: ["user": user, "password": password], encoding: URLEncoding.default, headers: ["Content-Type": "application/x-www-form-urlencoded"]).debugLog().validate().responseObject { (response: DataResponse<User>) in

            if let data = response.data {
                let json = String(data: data, encoding: String.Encoding.utf8)
                print("Failure Response: \(String(describing: json))")
            }

            let user = response.result.value
            if user?.userAccount != nil {
                callback(user?.userAccount)
            }
        }
    }

    public static func GetStatments(id: String, callback: @escaping (_ statments: Statments?) -> Void) {
        let url = Constants.BASEURL + "/statements/" + id
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Content-Type": "application/x-www-form-urlencoded"]).validate().responseObject { (response: DataResponse<Statments>) in

            let response = response.result.value
            print(response!)
            callback(response)
        }
    }
}
