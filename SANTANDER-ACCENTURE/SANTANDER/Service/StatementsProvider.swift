//
//  StatementsProvider.swift
//  SANTANDER
//
//  Created by Maíra Preto on 27/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import Foundation
import Alamofire

protocol StatementsProviderDelegate: class {
    
    func successLoadStatements(lists: List)
    func errorLoadStatements(error: Error?)
}

class StatementsProvider {
    
    weak var delegateStatements: StatementsProviderDelegate?
        
    func loadStatements() {
        
        let urlString: String = "https://bank-app-test.herokuapp.com/api/statements/1"
        
        if let url:URL = URL(string: urlString) {
           
            Alamofire.request(url, method: .get).responseJSON { (response) in
                
                if response.response?.statusCode == 200 {
                    do {
                        
                        let model = try JSONDecoder().decode(List.self, from: response.data ?? Data())
                        
                        print(model)
                        self.delegateStatements?.successLoadStatements(lists: model)
                        
                    } catch  let error{
                        
                        print( error)
                        self.delegateStatements?.errorLoadStatements(error: error)
                    }
                }else {
                
                    print(response.error ?? "")
                    self.delegateStatements?.errorLoadStatements(error: response.error)
                }
            }
                
            }
        
    }

}



