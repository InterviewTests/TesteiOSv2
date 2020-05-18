//
//  HomeBrain.swift
//  challenge-santander
//
//  Created by Hugo Ferreira on 17/05/20.
//  Copyright © 2020 Hugo Ferreira. All rights reserved.
//

import Foundation
import UIKit

struct HomeBrainModel {
    
    var userModel : UserModel?
    
    func requestStatement(_ userId: Int ,completionSuccess: @escaping ([StatementModel]) -> Void, completionError: @escaping (Error) -> Void) {
        let urlBase = "https://bank-app-test.herokuapp.com/api/statements/\(userId)"
        guard let url = URL(string: urlBase) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completionError(error)
                }
            }
            
            if let data = data {
                do{
                    let decoder = JSONDecoder()
                    let decodeData = try decoder.decode(StatementList.self, from: data)
                    DispatchQueue.main.async {
                        completionSuccess((decodeData.statementList)!)
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }    
    
}
