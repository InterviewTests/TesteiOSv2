//
//  TransformersUtil.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 20/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//
import Foundation
import ObjectMapper

class TransformersUtil: NSObject {

    static let dateTransformer: TransformOf<Date, String> = TransformOf<Date, String>(fromJSON: { (dateStr) -> Date? in
        return Date(string: dateStr)
    }, toJSON: { (date) -> String? in
        return date?.ISOString
    })
    static let simpleDateTransformer: TransformOf<Date, String> = TransformOf<Date, String>(fromJSON: { (dateStr) -> Date? in
        return Date(string: dateStr, dateFormat: "dd-mm-yyyy")
    }, toJSON: { (date) -> String? in
        return date?.ISOString
    })
    

}
