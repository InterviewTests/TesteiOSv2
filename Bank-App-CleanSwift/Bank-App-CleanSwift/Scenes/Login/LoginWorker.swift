//
//  LoginWorker.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

protocol LoginWorkLogic: class {
    func doWork(with: User)
}


class LoginHTTPRequestWorker: LoginWorkLogic {
    func doWork(with: User) {
        
    }    
}
