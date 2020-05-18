//
//  LoginBrain.swift
//  challenge-santander
//
//  Created by Hugo Ferreira on 16/05/20.
//  Copyright © 2020 Hugo Ferreira. All rights reserved.
//

import Foundation


struct LoginBrainModel {
    
    func isValidLogin(_ user: String?, _ password: String?) -> Bool {
        var loginValid = true
        if(isValidEmail(user ?? "") || isValidCPF(user ?? "")) {
            if(isValidPassword(password ?? "")){
                loginValid = true
            } else {
                loginValid = false
            }
        } else {
            loginValid = false
        }
        
        return loginValid
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    func isValidCPF(_ testStr:String) -> Bool {
        let onlyNumbers = testStr.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "-", with: "")
        let numbers = onlyNumbers.compactMap({ Int(String($0)) })
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        func digitCalculator(_ slice: ArraySlice<Int>) -> Int {
            var number = slice.count + 2
            let digit = 11 - slice.reduce(into: 0) {
                number -= 1
                $0 += $1 * number
                } % 11
            return digit > 9 ? 0 : digit
        }
        let dv1 = digitCalculator(numbers.prefix(9))
        let dv2 = digitCalculator(numbers.prefix(10))
        return dv1 == numbers[9] && dv2 == numbers[10]
    }
    
    
    func isValidPassword(_ testStr: String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[@$!%*#?&])(?=.*[a-z0-9])[A-Za-z0-9@$!%*#?&]{3,}$"
        
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: testStr)
    }
    
    func requestLogin(completionSuccess: @escaping (UserModel) -> Void, completionError: @escaping (Error) -> Void) {
        
        let urlBase = "https://bank-app-test.herokuapp.com/api/login"
        let params : [String:String] = ["user": "test_users", "password": "Test@1"]
        guard let url = URL(string: urlBase) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else { return }
        
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completionError(error)
                }
            }
            
            if let data = data {
                do{
                    let decoder = JSONDecoder()
                    let decodeData = try decoder.decode(UserAccount.self, from: data)
                    DispatchQueue.main.async {
                        completionSuccess((decodeData.userAccount)!)
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
}



