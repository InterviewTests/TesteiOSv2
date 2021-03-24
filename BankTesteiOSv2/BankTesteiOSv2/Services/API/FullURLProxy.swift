//
//  FullURLProxy.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation

class FullURLProxy: RootEndPointProxy
{
    static func fullURLproxy(_ path: String ) -> String
    {
        return rootEndpoint + path
    }
}
