//
//  LoginInteractor.swift
//  BankTest
//
//  Created by Jaber Vieira Da Silva Shamali on 05/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginBusinessLogic{
    func doSomething(request: Login.Something.Request)
    func doLogin(request: Login.Something.Request)
}

protocol LoginDataStore{
    var clienteData: ClienteConvert { get set }

}

class LoginInteractor: LoginBusinessLogic, LoginDataStore{
    
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    var clienteData = ClienteConvert()

  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Login.Something.Request){
    worker = LoginWorker()
    worker?.doSomeWork()
    
    let response = Login.Something.Response()
    presenter?.presentSomething(response: response)
  }
    
    func doLogin(request: Login.Something.Request) {
        worker = LoginWorker()
        worker?.doLogin(login: request.login, completionHandler: { (result) in
            let data = result
            
            let currencyFormateer = NumberFormatter()
            currencyFormateer.locale = Locale(identifier: "pt-br")
            currencyFormateer.numberStyle = .currency
            let price = currencyFormateer.string(from: NSNumber(value: result.userAccount!.balance))
    
            var agency = result.userAccount?.agency
            agency!.insert(".", at: (agency?.index(agency!.startIndex, offsetBy: 2))!)
            agency!.insert("-", at: (agency?.index(agency!.startIndex, offsetBy: 9))!)
            
            let conta = "\(result.userAccount?.bankAccount ?? "") / \(agency ?? "")"
            
            self.clienteData.name = result.userAccount?.name
            self.clienteData.account = conta
            self.clienteData.balance = price
            
            let response = Login.Logged.Response(cliente: data)
            self.presenter?.presentDetail(response: response)
//            
        })
        
    }
}
