//
//  Config.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 10/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import Foundation

struct Config {
    
    struct Server {
        static let url = getBundleValue("SERVER_URL")
        
        private static func getBundleValue(_ key: String) -> String {
            guard let value = Bundle.main.object(forInfoDictionaryKey: key) as? String else { return "" }
            return value
        }
    }
    
}
