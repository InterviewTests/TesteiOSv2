//
//  DetailInteractor.swift
//  SantanderSample
//
//  Created by Virgilius Santos on 26/10/18.
//  Copyright (c) 2018 Virgilius Santos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailBusinessLogic{
    func getDetails()
    func logout()
}

protocol DetailDataStore{
    var user: Login.UserAccount? { get set }
    var detail: [Detail.Statement] {get}
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore
{
    var presenter: DetailPresentationLogic?
    var worker: DetailWorker?
    
    var user: Login.UserAccount?
    var detail: [Detail.Statement] = []
    
    // MARK: Do something
    
    func logout() {
        user = nil
        detail = []
    }
    
    func getDetails() {
        
        var response = Detail.Response()
        
        response.name = self.user?.name
        response.bankAccount = self.user?.bankAccount
        response.agency = self.user?.agency
        response.balance = self.user?.balance
        
        self.presenter?.presentUserInfo(response: response)
        
        
        var request = Detail.Request()
        request.userId = user?.userId
        
        worker?.getDetails(request: request, completion: { (result) in
            switch result {
            case .success(let resp):
                
                response.statementList = resp.statementList
                
                self.detail = resp.statementList
                self.presenter?.present(response: response)
                break
            case .error(let error):
                response.error = Detail.DetailError()
                response.error?.code = 0
                response.error?.message = error.localizedDescription
                self.presenter?.present(response: response)
                break
            }
        })
        
    }
}
