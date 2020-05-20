//
//  HeaderHandler.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit

class HeaderHandler {
    
    typealias Header = [String: String]
    
    enum HeaderType {
        case basic
        case application
    }
    
    func generate(header: HeaderType) -> [String: String] {
        switch header {
        case .basic:
            return self.getBasicHeader()
        case .application:
            return self.getApplicationHeader()
        }
    }
    
    private func getBasicHeader() -> Header {
        let dictionary = ["Content-Type": "application/json; charset=utf-8"]
        return dictionary
    }
    
    private func getApplicationHeader() -> Header {
        let dictionary = ["Content-Type": "application/x-www-form-urlencoded"]
        return dictionary
    }
}
