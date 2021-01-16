//
//  LoginInteractor.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

class LoginInteractor {
    
    var presenter: LoginPresenterProtocol?
    var userInfo: LoginModels.LoggedinUserEntity?
    
    enum LoginError: Error, Equatable {
        case blankUsername
        case blankPassword
        case invalidUsername
        case invalidPassword(message: String)
    }
    
    
    // MARK: - Validation Methods
    
    func validateLogin(_ loginForm: LoginFormProtocol, completion: (LoginForm) -> Void, fail: (String) -> Void) {
        
        do {
            let username = try validateUsername(loginForm.username)
            let password = try validatePassword(loginForm.password)
            
            completion(LoginForm(username: username, password: password))
        }
        catch LoginError.blankUsername { fail("Username não informado") }
        catch LoginError.invalidUsername {
            fail("Username inválido.\nUsername deve ser um e-mail ou número de cpf")
        }
        catch LoginError.blankPassword { fail("Senha não informada") }
        catch LoginError.invalidPassword(let invalidPasswordMessage) {
            fail(invalidPasswordMessage)
        }
        catch { fail("Falha ao validar login") }
    }
    
    func validateUsername(_ username: String?) throws -> String {
        let username = (username ?? "").trimmingCharacters(in: .whitespaces)
        
        if username.isEmpty { throw LoginError.blankUsername }
        if validateCPF(username) != nil { return username }
        if !validateEmail(username) { throw LoginError.invalidUsername }
        
        return username
    }
    
    func validatePassword(_ password: String?) throws -> String {
        let password = password ?? ""
        
        if password.isEmpty { throw LoginError.blankPassword }
        
        let passwordRequirementsMessage = """
        Senha deve conter:
        Ao menos 8 caracteres,
        um número, uma letra maiúscula e um caracter especial -@#$%^&*.
        """

        //mustIncludeUppercased: (?=.*[A-Z])
        //mustIncludeLowercased: (?=.*[a-z])
        //mustIncludeDigits: (?=.*[0-9])
        //mustIncludeSpecialCharacters: (?=.*[@#$%^&*])
        //minMaxNumCharacters: .{minNum,maxNum}
        
        let passwordRegex = "(?=.*[A-Z])(?=.*[0-9])(?=.*[-@#$%^&*]).{8,}"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        
        if !passwordPredicate.evaluate(with: password) { throw LoginError.invalidPassword(message: passwordRequirementsMessage) }
        
        return password
    }
    
    func validateCPF(_ username: String) -> String? {
        var cpf = username.replacingOccurrences(of: ".", with: "")
        cpf = cpf.replacingOccurrences(of: "-", with: "")
        
        guard cpf.count == 11, cpf.onlyNumbers.count == 11 else { return nil }
        
        for i in 1..<cpf.count {
            if cpf.at(i) != cpf.at(0) { break }
            else if i == cpf.count - 1 { return nil }
        }
        
        let i1 = cpf.index(cpf.startIndex, offsetBy: 9)
        let i2 = cpf.index(cpf.startIndex, offsetBy: 10)
        let i3 = cpf.index(cpf.startIndex, offsetBy: 11)
        let d1 = Int(cpf[i1..<i2])
        let d2 = Int(cpf[i2..<i3])
        
        var temp1 = 0, temp2 = 0
        
        for i in 0...8 {
            let start = cpf.index(cpf.startIndex, offsetBy: i)
            let end = cpf.index(cpf.startIndex, offsetBy: i+1)
            let char = Int(cpf[start..<end])
            
            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)
        }
        
        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1
        
        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2
        
        if temp1 == d1 && temp2 == d2 { return cpf }
        else { return nil }
    }
    
    func validateEmail(_ email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        if !emailPredicate.evaluate(with: email) { return false }
        return true
    }
    
    
    // MARK: - Methods
    
    func requestLogin(_ loginForm: LoginForm ) {
        presenter?.startRequest()
        LoginRequester.postLogin(loginForm) { response in
            self.presenter?.finishRequest()
            
            self.manageLoginResponse(response)
        } fail: { errorMessage in
            self.presenter?.finishRequest()
            
            self.presenter?.loginDidFail(errorMessage)
        }
    }
    
    func manageLoginResponse(_ response: LoginResponseStruct) {
        guard let userInfo = LoginModels.LoggedinUserEntity(userInfo: response.userAccount) else {
                if let errorMessage = BadRequestStruct(badRequest: response.error) {
                    self.presenter?.loginDidFail("\(errorMessage.message!) (\(errorMessage.code!))")
                }
                else { self.presenter?.loginDidFail("Falha ao fazer o login") }
                return }
        
        self.userInfo = userInfo
        self.saveUserInfoLocally(userInfo)
        self.presenter?.didLoginWithSuccess(response: LoginModels.Response(userInfo: userInfo))
    }
    
    
    func saveUserInfoLocally(_ userInfo: LoginModels.LoggedinUserEntity) {
        // TODO: Salvar info do usuario localmente
    }
    
    func findUserInfoSavedLocally() -> Bool {
        // TODO: Buscar se há usuario salvo localmente
        
//        guard let fetchedObjects = LoginInfoLocalEntity.fetchAll() else { return false }
//
//        return fetchedObjects.count > 0
        return false
    }
    
}


// MARK: - Access from View

extension LoginInteractor: LoginInteractorProtocol {
    func viewWillAppear() {
        presenter?.hasUserInfoSaved(findUserInfoSavedLocally())
    }
    
    func login(_ loginForm: LoginFormProtocol) {
        validateLogin(loginForm) { loginForm in
            self.requestLogin(loginForm)
        } fail: { errorMessage in
            self.presenter?.didFailToValidate(errorMessage)
        }
    }
}
