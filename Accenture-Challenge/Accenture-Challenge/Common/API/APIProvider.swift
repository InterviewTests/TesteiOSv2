//
//  APIProvider.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import Foundation

enum EndPoint {
    case login
    case statements(String)
    
    func getExtension() -> String {
        switch self {
        case .login: return "login"
        case .statements(let idUser): return "statements/\(idUser)"
        }
    }
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum APIResponse {
    case sucess(Data)
    case clientError(Error)
    case urlNotFound
    case errorToFetchData
}

class APIProvider {
    
    static let shared = APIProvider()
    
    private let baseURL = "https://bank-app-test.herokuapp.com/api/"
    
    private init() { }
    
    func request(body: String,
                 httpMethod: HttpMethod,
                 endpoint: EndPoint,
                 completion: @escaping APIResponseCallback) {
        guard let request = getCompleteRequest(forBody: body,
                                               httpMethod: httpMethod,
                                               endPoint: endpoint) else {
            completion(.urlNotFound)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                if let error = error {
                    completion(.clientError(error))
                }
                return
            }
            guard let data = data else {
                completion(.errorToFetchData)
                return
            }
            completion(.sucess(data))
        }
        task.resume()
    }
    
    func login(_ login: String, password: String, completionHandler: @escaping LoginResponseCallback) {
           
           var request = URLRequest(url: URL(string: "https://bank-app-test.herokuapp.com/api/login")!)
           request.httpMethod = "POST"
           request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
           
           let bodyData = "user=\(login)&password=\(password)"
           request.httpBody = bodyData.data(using: .utf8)
           
           let session = URLSession.shared
           let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
               do {
                   //verify response
                   if let httpResponse = response as? HTTPURLResponse {
                       if httpResponse.statusCode == 200{ //Verifica se a consulta deu certo
                           guard let data = data else {return}
                           do {
                               if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                   if let user = json["userAccount"] as? [String: Any] {
                                       let userReturn = try JSONSerialization.data(withJSONObject: user, options: [])
                                       let decoder = JSONDecoder()
                                    let retorno = try decoder.decode(Login.Info.User.self, from: userReturn)
                                       
                                       DispatchQueue.main.async {
                                        print(retorno)
//                                        completionHandler(.success(retorno))
                                       }
                                   }
                               }
                           } catch let jsonErr {
                               print("Erro ao serializar o JSON", jsonErr)
                           }
                       }
                   }
               }
           })
           
           task.resume()
       }
}

extension APIProvider {
    
    private func getCompleteRequest(forBody body: String,
                                    httpMethod: HttpMethod,
                                    endPoint: EndPoint) -> URLRequest? {
        let urlStr = baseURL + endPoint.getExtension()
        guard let url = URL(string: urlStr) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body.data(using: .utf8)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        return request
    }
}
