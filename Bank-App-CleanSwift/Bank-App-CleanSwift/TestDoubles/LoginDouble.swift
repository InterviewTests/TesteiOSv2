//
//  LoginDouble.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

enum LoginDouble {
    struct UserWithGoodEmailAndGoodPassword {
        let user = User(name: "john.appleseed@accenture.com", password: "Test@1")
    }
    
    struct UserWithGoodCpfWithoutDotsAndGoodPassword {
        let user = User(name: "15560606022", password: "Test@1")
    }
    
    struct UserWithGoodCpfWithDotsAndGoodPassword {
        let user = User(name: "155.606.060-22", password: "Test@1")
    }
    
    struct UserWithGoodEmailAndBadPassword {
        let user = User(name: "john@appleseed@accenture.com", password: "aaa")
    }
    
    struct UserWithGoodCpfWithoutDotsAndBadPassword {
        let user = User(name: "15560606022", password: "aaa")
    }
    
    struct UserWithGoodCpfWithDotsAndBadPassword {
        let user = User(name: "155.606.060-22", password: "aaa")
    }
    
    struct UserWithBadEmailAndGoodPassword {
        let user = User(name: "john.appleseed", password: "Test@1")
    }
    
    struct UserWithBadCpfWithoutDotsAndGoodPassword {
        let user = User(name: "11111111111", password: "Test@1")
    }
    
    struct UserWithBadCpfWithDotsAndGoodPassword {
        let user = User(name: "111.111.111.11", password: "Test@1")
    }
    
    struct UserWithRandomBadCpfWithDotsAndGoodPassword {
        let user = User(name: "987.654.321.09", password: "Test@1")
    }
    
    struct UserWithRandomBadCpfWithoutDotsAndGoodPassword {
        let user = User(name: "98765432109", password: "Test@1")
    }
    
    struct UserWithBlankUserFieldAndGoodPassword {
        let user = User(name: "", password: "Test@1")
    }
    
    struct UserWithGoodUserFieldAndBlankPassword {
        let user = User(name: "155.606.060-22", password: "aaa")
    }
    
    struct UserWithBlankFields {
        let user = User(name: "", password: "")
    }
    
}
