//
//  ApiManager.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright © 2019 Sakura Soft. All rights reserved.
//

import UIKit

typealias Response = (Data?, Error?) -> ()

class ApiManager: NSObject {
    func performLogin(requestData: LoginModel.Login.Request, completion: @escaping Response) {
        guard let urlRequest = URL(string: Constants.Url.login) else { return }
        var request = URLRequest(url: urlRequest)
        request.httpMethod = "POST"
        request.httpBody = requestData.getBody().data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            completion(data, error)
        }.resume()
    }
}
