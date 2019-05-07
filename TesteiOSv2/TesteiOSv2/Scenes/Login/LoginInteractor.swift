//
//  LoginInteractor.swift
//  TesteiOSv2
//
//  Created by Lucas Saito on 06/05/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Foundation

protocol LoginInteractorProtocol {
    func validateLogin(request: LoginModel.Request)
}

class LoginInteractor: LoginInteractorProtocol {
    var worker: LoginWorker? = LoginWorker()
    var presenter: LoginPresenterProcotol?
    
    func validateLogin(request: LoginModel.Request) {
        guard let user = request.user, let password = request.password else {
            presenter?.presentErrorMessage(message: "Erro no Request")
            return
        }
        
        if user.isEmpty {
            presenter?.presentErrorMessage(message: "Preencha o campo User")
            return
        }
        if password.isEmpty {
            presenter?.presentErrorMessage(message: "Preencha o campo Password")
            return
        }
        
        if !isValidEmail(testStr: user) && !isValidCPF(testStr: user) {
            presenter?.presentErrorMessage(message: "Campo User inválido. Informe um e-mail ou CPF.")
            return
        }
        
        if !isValidPassword(testStr: password) {
            presenter?.presentErrorMessage(message: "Campo Password inválido. Necessário pelo menos uma letra maiúscula, um caracter especial e um caracter alfanumérico.")
            return
        }
        
        worker?.requestLogin(request: request, completionSuccess: { (response) in
            self.presenter?.presentErrorMessage(message: "LOGIN SUCCESS")
            return
        }, completionError: { (error) in
            self.presenter?.presentErrorMessage(message: error.localizedDescription)
            return
        })
        
    }
    
    private func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    private func isValidCPF(testStr:String) -> Bool {
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
    private func isValidPassword(testStr: String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[@$!%*#?&])(?=.*[a-z0-9])[A-Za-z0-9@$!%*#?&]{3,}$"
        
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: testStr)
    }
}
