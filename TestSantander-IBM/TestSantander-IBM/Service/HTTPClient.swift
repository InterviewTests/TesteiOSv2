//
//  HTTPClient.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import Foundation

class HTTPClient{
    
    static let shared = HTTPClient()
    
    //a camada de Services esta possivelmente um pouco fora da
    //arquitetura pedida pq optei por fazer ela nativa e ainda nao
    //sei fazer muito bem essa arquitetura
    func fetchGenericData<T: Decodable>(urlString:String, method:String, params: [String:Any]?, completion: @escaping (T?, String?) -> ()){
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        if let par = params {
            let getString = setGETString(params: par)
            request.httpBody = getString.data(using: .utf8)
        }
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, err: Error?) in
            if let err = err {
                print("failed to fetch data: ", err)
                completion(nil, err.localizedDescription)
                return
            }
            guard let data = data else { return }
            
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
                completion(obj, nil)
            } catch let jsonErr {
                print("failed to decode json: ", jsonErr)
                completion(nil, jsonErr.localizedDescription)
            }
            }.resume()
    }
    
    func setGETString(params:[String:Any]) -> String {
        var data = [String]()
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
}
