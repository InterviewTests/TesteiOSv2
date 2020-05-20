//
//  API.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

enum Environment: String {
       case production = "https://bank-app-test.herokuapp.com/api"
       
       func getValue() -> String {
           return self.rawValue
       }
   }
