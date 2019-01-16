//
//  Dictionary+Extension.swift
//  TesteiOSv2
//
//  Created by Alex Nunes da Silva on 15/01/19.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import Foundation

extension Dictionary {
    func queryFormat() -> String {
        var cs = CharacterSet.urlQueryAllowed
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        cs.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return self.map{
            let keyEnconding = String(describing: $0).addingPercentEncoding(withAllowedCharacters: cs) ?? ""
            let valueEnconding = String(describing: $1).addingPercentEncoding(withAllowedCharacters: cs) ?? ""
            return keyEnconding + "=" + valueEnconding
            }.joined(separator: "&")
    }
}
