//
//  TestFactories+Extension.swift
//  DataTests
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

var dataInvalid: Data {
    return .init("Data Invaid".utf8)
}

var url: URL {
    return URL(string: "http://url-mock.com")!
}
