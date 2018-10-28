//
//  EndPointType.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 28/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
