//
//  LoginProvider.swift
//  SANTANDER
//
//  Created by Maíra Preto on 25/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import Foundation
import Alamofire


protocol UserProviderDelegate: class {
    
    func successLoadUsers(users: User)
    func errorLoadUsers(error: Error?)
}

class UserProvider {
    
    weak var delegate: UserProviderDelegate?
    
    
    func loadUsers() {
        
        let urlString: String = "https://bank-app-test.herokuapp.com/api/login"
        
        if let url:URL = URL(string: urlString) {
           
            Alamofire.request(url, method: .get).responseJSON { (response) in
                
                if response.response?.statusCode == 200 {
                    
                    do {
                        
                        let model:User = try JSONDecoder().decode([UserAccount].self, from:  response.data ?? Data())
                        
                        print(model)
                        self.delegate?.successLoadUsers(users: model)
                        
                    } catch  let error{
                        print( error)
                        self.delegate?.errorLoadUsers(error: error)
                    }
                }else {
                    print("=========error")
                    print(response.error)
                    self.delegate?.errorLoadUsers(error: response.error)
                }
            }
                
            }
        
    }

}

