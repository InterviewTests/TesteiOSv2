//
//  Service.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 24/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit
import Alamofire

typealias SucessoLogin = (Data) -> Void

struct Account : Decodable {
    var agency : String
    var balance : Float
    var bankAccount : String
    var name : String
    var userId : Int
}

struct ResponseAccount : Decodable {
    var userAccount : Account
}

class Service: NSObject {
    
//    class func doAuthentication(response:@escaping ()) {
//
//        let url = "https://bank-app-test.herokuapp.com/api/login"
//        let parameters : Parameters = ["user": "test_user", "password" : "Test@1"]
//
//        Alamofire.request(url, method: .post, parameters: parameters, headers: [:]).validate().responseData { (response) in
//
//            switch response.result {
//            case .success:
//                let decoder = JSONDecoder()
//                let parseResponse: Result<ResponseAccount> = decoder.decodeResponse(from: response)
//                    parseResponse.value
//
//            case .failure(let error):
//                debugPrint("error: \(error)")
//            }
//
//        }

    
        
//    }tttt
    
}

extension JSONDecoder {
    func decodeResponse<T: Decodable>(from response: DataResponse<Data>) -> Result<T> {
        guard response.error == nil else {
            print(response.error!)
            return .failure(response.error!)
        }
        
        guard let responseData = response.data else {
            print("didn't get any data from API")
            return .failure(response.error!)
//            return .failure(BackendError.parsing(reason:
//                "Did not get data in response"))
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            print("error trying to decode response")
            print(error)
            return .failure(error)
        }
    }
}

