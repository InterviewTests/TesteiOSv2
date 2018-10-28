//
//  HTTPTask.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 28/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?, bodyEncoding: ParameterEncoding, urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?, bodyEncoding: ParameterEncoding, urlParameters: Parameters?, additionHeaders: HTTPHeaders?)
}
