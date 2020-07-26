//
//  APICaller.swift
//  Accenture iOS Test
//
//  Created by João Pedro Giarrante on 26/07/20.
//  Copyright © 2020 João Pedro Giarrante. All rights reserved.
//

import Foundation

struct APICaller {
    
    
    func getAccountInfo(user: String, password: String, delegate: LoginViewController) {
        print("\n==================== LOGIN ====================\n-> User: "+user+"\nPassword: "+password+"\n===============================================\n\n")
        let request = URLRequest(url: URL(string: "https://bank-app-test.herokuapp.com/api/statements/1")!)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                if let error = error {
                  print("DataTask error: " + error.localizedDescription + "\n")
                    
                } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                    
                    let statementList = json["statementList"] as? [NSDictionary]
                    let error = json["error"] as? [String]
                    
                    if(error != nil){
                        print("DataTask error: " + error!.description + "\n")
                    }else if(statementList != nil){
                        DispatchQueue.main.async {
                            delegate.getAccountInfoResponse(response: statementList!)
                        }
                    }
                    
                }
            } catch {
                print("DataTask error")
            }
        })

        task.resume()
    }
    
    
    
}
