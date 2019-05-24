//
//  BaseServiceModel.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 24/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//
import Foundation

protocol BaseServiceModel: Codable {
    static func parse(jsonData: Data) -> BaseServiceModel
//    static func decodeWith<T: Codable>(jsonString: String) -> T
}

//class BaseServiceModel: BaseServiceModelProtocol{
//
//    required init(){
//        return Self()
//    }
//
//    static func decodeWith<T: Codable>(jsonString: String) -> T{
//        let data = jsonString.data(using: .utf8)
//        let decoder = JSONDecoder()
//        let object = try! decoder.decode(T.self, from: data!)
//        return object
//    }
//
//}
