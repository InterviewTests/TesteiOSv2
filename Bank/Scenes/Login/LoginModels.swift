//
//  LoginModels.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import Foundation

enum Login {
    struct ViewModel {
        struct DiplayedUser {
            var login: String
            var password: String
            
            func isPasswordValid() -> Bool {
                return password.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil
                    && password.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil
                    && password.rangeOfCharacter(from: CharacterSet.alphanumerics) != nil
                    && password.rangeOfCharacter(from: CharacterSet.punctuationCharacters) != nil
            }
        }
    }
}
