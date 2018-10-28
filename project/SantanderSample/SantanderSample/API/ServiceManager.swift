//
//  ServiceManager.swift
//  SantanderSample
//
//  Created by Virgilius Santos on 27/10/18.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import Foundation

protocol APIRequestLogin: Encodable {
    associatedtype Response: Decodable
    var user: String? {get}
    var password: String? {get}
}

protocol APIRequestDetail: Encodable {
    associatedtype Response: Decodable
    var userId: Int? {get}
}

protocol APIResponse: Decodable {
}

enum APIError: Error {
    case missingInfo, loginFail
}

enum Result<S,F> {
    case success(S)
    case error(F)
}

protocol APIClient {
    func send<T: APIRequestLogin>(
        _ request: T,
        completion: @escaping (Result<T, Error>)->()
    )
}

class ServiceManager {
    
    private let loginUrl
        = URL(string: "https://bank-app-test.herokuapp.com/api/login/")!
    
    private let detailUrl
        = URL(string: "https://bank-app-test.herokuapp.com/api/statements/")!
    
    public func login<T: APIRequestLogin>(
        _ request: T, completion: @escaping (Result<T.Response, Error>)->()) {
        
        let headers = [
            "key": "Content-Type",
            "name": "Content-Type",
            "value": "application/x-www-form-urlencoded",
            "type": "text"
        ]
        
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = headers
        
        let session = URLSession(configuration: config)
        
        let mutableRequest = NSMutableURLRequest(url: loginUrl)
        do {
            let dict = try request.toJson()
            mutableRequest.encodeParameters(parameters: dict)
        } catch {
            completion(.error(error))
        }
        
        let task = session.dataTask(with: mutableRequest as URLRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.error(error!))
                return
            }
//            if let resp = response {
//                print(resp)
//            }
            do {
                let object = try T.Response.decoder(data: data)
                completion(.success(object))
            } catch {
                completion(.error(error))   
            }
        }
        
        task.resume()
        
    }
    
    public func get<T: APIRequestDetail>(
        _ request: T, completion: @escaping (Result<T.Response, Error>)->()) {
        
        let session = URLSession.shared
        
        let id = request.userId != nil ? "\(request.userId!)" : ""
        let url = detailUrl.appendingPathComponent(id)
        
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.error(error!))
                return
            }
//            if let resp = response {
//                print(resp)
//            }
            do {
                let object = try T.Response.decoder(data: data)
                completion(.success(object))
            } catch {
                completion(.error(error))
            }
        }
        
        task.resume()
        
    }
    
}



extension NSMutableURLRequest {
    
    /// Percent escape
    ///
    /// Percent escape in conformance with W3C HTML spec:
    ///
    /// See http://www.w3.org/TR/html5/forms.html#application/x-www-form-urlencoded-encoding-algorithm
    ///
    /// - parameter string:   The string to be percent escaped.
    /// - returns:            Returns percent-escaped string.
    
    private func percentEscapeString(_ string: String) -> String {
        var characterSet = CharacterSet.alphanumerics
        characterSet.insert(charactersIn: "-._* ")
        
        return string
            .addingPercentEncoding(withAllowedCharacters: characterSet)!
            .replacingOccurrences(of: " ", with: "+")
            .replacingOccurrences(of: " ", with: "+", options: [], range: nil)
    }
    
    /// Encode the parameters for `application/x-www-form-urlencoded` request
    ///
    /// - parameter parameters:   A dictionary of string values to be encoded in POST request
    
    func encodeParameters(parameters: [String : Any]) {
        httpMethod = "POST"
        
        let parameterArray = parameters.map { (arg) -> String in
            
            let (key, value) = arg
            return "\(key)=\(self.percentEscapeString(value as! String))"
        }
        
        httpBody = parameterArray.joined(separator: "&").data(using: String.Encoding.utf8)
    }
}
