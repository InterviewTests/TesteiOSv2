//
//  URLProvider.swift
//  toroguru
//
//  Created by Felipe perius on 16/01/18.
//  Copyright © 2018 br.com.toroguru. All rights reserved.
//

import UIKit

class URLBaseManager: NSObject {
    static let serviceDomain: String = "https://bank-app-test.herokuapp.com/api"
    
    class var baseURL: URL {
        return URL(string: "\(serviceDomain)")!
    }
}
