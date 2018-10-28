//
//  Codable.swift
//  SantanderSample
//
//  Created by Virgilius Santos on 27/10/18.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import Foundation

enum CodableError: Error {
    case encodeError, decodeError
}

extension Encodable {
    func toJson(excluding keys: [String] = [String]()) throws -> [String:Any] {
        
        let objectData = try JSONEncoder().encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: objectData, options: [])
        
        guard var json = jsonObject as? [String:Any] else {
            print("Error to encode")
            throw CodableError.encodeError
        }
        
        keys.forEach { json[$0] = nil }
        
        return json
    }
}

extension Decodable {
    static func decoder(json: [String:Any] = [String:Any](),
                        with id: String? = nil) throws -> Self {
        
        var json = json
        if id != nil {
            json["id"] = id!
        }
        do {
            let documentData = try JSONSerialization.data(withJSONObject: json, options: [])
            let decodeObject = try JSONDecoder().decode(Self.self, from: documentData)
            return decodeObject
        } catch {
            throw CodableError.decodeError
        }
        
    }
    
    static func decoder(data: Data?) throws -> Self {
        guard let data = data else {
            throw CodableError.decodeError
        }
        
        do {
            let decodeObject
                = try JSONDecoder().decode(Self.self, from: data)
            return decodeObject
        } catch {
            throw CodableError.decodeError
        }
        
    }
}
