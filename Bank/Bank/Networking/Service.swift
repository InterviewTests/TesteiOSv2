//
//  Service.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import Alamofire
import AlamofireNetworkActivityLogger

class Service {
    
    let env: String
    
    init(withEnvironment environment: Environment) {
        env  = environment.getValue()
        #if DEBUG
        NetworkActivityLogger.shared.level = .debug
        NetworkActivityLogger.shared.startLogging()
        #endif
    }
    
    func urlComposer(using endpoint: Endpoint.EndpointType) -> (url: URL?, method: String) {
        let url = (url: URL(string: "\(env)\(endpoint.uri)"), method: endpoint.method)
        return url
    }
    
    func requestComposer(using urlEndpoint: (url: URL?, method: String),
                         headers: HeaderHandler.Header,
                         body: [String: Any]? = nil) -> URLRequest {
        
        var request = URLRequest(url: urlEndpoint.url!)
        request.allHTTPHeaderFields = headers
        request.httpMethod = urlEndpoint.method
        
        if let body = body {
            let jsonData = try? JSONSerialization.data(withJSONObject: body)
            request.httpBody = jsonData
        }
        
        return request
    }
    
    
    func fetch<T: BankCodable>(
        using request: URLRequest,
        success: @escaping (( _ response: T) -> Void ),
        failure: @escaping ((_ error: ErrorHandler) -> Void )) {
        Alamofire.request(request).responseData { [weak self] (response) in
            switch response.result {
            case .success(let data):
                guard let responseDecoded = self?.JSONDecode(to: T.self, from: data) else {
                    failure(ErrorHandler(code: -1100, message: "Parece que algo saiu fora do previsto..."))
                    return
                }
                success(responseDecoded)
            case .failure(let error):
                failure(error as! ErrorHandler)
            }
        }
    }
    
    func JSONDecode<T: Codable>(to object: T.Type, from data: Data) -> T? {
        do {
            let object = try JSONDecoder().decode(T.self, from: data) as T
            return object
        } catch let error {
            if object != ErrorHandler.self {
                #if DEBUG
                print("\n❓JSONDecoder -> \(T.self): \(error)\n")
                #endif
            }
            return nil
        }
    }
    
}
