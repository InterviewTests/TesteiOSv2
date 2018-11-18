//
//  ServiceManager.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit
import Alamofire
class ServiceManager: NSObject {
    static var defaultClient : Alamofire.SessionManager = {
        // Create custom manager
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 40
        
        let man = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default
        )
        return man
    }()
}
