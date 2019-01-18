//
//  LoginViewModel.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 16/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import RxSwift
import RxCocoa
import RealmSwift


class LoginViewModel {
    
    let loginViewModel = BehaviorRelay<String>(value:"")
    let passwordViewModel = BehaviorRelay<String>(value:"")
    
    let isSuccess = BehaviorRelay<Bool>(value: false)
    let isLoading = BehaviorRelay<Bool>(value: false)
    let errorMsg = BehaviorRelay<String>(value:"")
    
    func perfomrLogin() {
        
        let login = LoginModel(login: loginViewModel.value, password: passwordViewModel.value)
        
        TesteAPIManager.shared.login(withLogin: login, failure: { (error) in
            self.isLoading.accept(false)
            self.isSuccess.accept(false)
            self.errorMsg.accept(error ?? "Algo aconteceu. Tente novamente")
        }) { (result) in
            self.isLoading.accept(false)
            if let user = result?.userAccount, user.userId != nil {
                self.saveUserAtRealm(user: user)
                self.isSuccess.accept(true)
            }else if let loginError = result?.error?.message {
                self.isSuccess.accept(false)
                self.errorMsg.accept(loginError)
            }
        }
    }
    
    func validateUserAndPassword() {
        
        isLoading.accept(true)
        errorMsg.accept("")
        
        if loginViewModel.value.isEmpty {
            isLoading.accept(false)
             isSuccess.accept(false)
            errorMsg.accept("Insira o login")
            
        } else {
            if passwordViewModel.value.isValidPassord() { perfomrLogin() }
            else {
                isLoading.accept(false)
                isSuccess.accept(false)
                errorMsg.accept("A senha deve ter pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico")
            }
        }
    }
    
    func saveUserAtRealm(user: UserAccountModel) {
        let container = try! Container()
        try! container.write { transaction in
            transaction.add(user, update: true)
        }
    }
}
