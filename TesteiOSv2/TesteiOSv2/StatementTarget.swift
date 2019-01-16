//
//  StatementTarget.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation
import Alamofire

enum StatementTarget{
    case list(page: Int)
}
extension StatementTarget{
    var Url: URL {
        switch self {
        case .list:
            return APISettings.composeURL(with: self.path)
        }
    }
    
    var path: String {
        switch self {
        case .list:
            return API_URL_LOGIN
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .list:
            return .get
        }
    }
    
    var parameters : Parameters {
        switch self {
        case .list(let page):
            return ["":page]
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
