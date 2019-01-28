//
//  Router.swift
//  TestSantander-IBM
//
//  Created by Renato Carvalhan on 24/01/19.
//  Copyright © 2019 Renato Carvalhan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

public typealias NetworkRouterCompletion = (_ response: DataResponse<Any>?,_ error: Error?)->()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
}

class Router<EndPoint: EndPointType>: NetworkRouter {
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        Alamofire.request(route.baseURL.appendingPathComponent(route.path), method: route.httpMethod, parameters: route.params, encoding: JSONEncoding()).responseJSON { (response) in
            
            switch response.result {
            case .success:
                completion(response, response.error)
                break
            case .failure(let err):
                completion(nil, err)
                break
            }
        }
    }
}
