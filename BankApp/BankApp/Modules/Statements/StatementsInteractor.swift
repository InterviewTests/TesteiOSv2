//
//  StatementsInteractor.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

class StatementsInteractor {
    
    var presenter: StatementsPresenterProtocol?
    var statementsList: [StatementsModels.StatementEntity] = []
    
    var userInfo: StatementsModels.UserInfoResponse
    
    init(userInfo: StatementsModels.UserInfoResponse) {
        self.userInfo = userInfo
    }
    
    
    // MARK: - Methods
    
    func fetchStatement() {
        presenter?.startRequest()
        StatementRequester.getAll(userId: userInfo.info.userId) { response in
            self.presenter?.finishRequest()
            
            self.manageFetchResponse(response)
        } fail: { errorMessage in
            self.presenter?.finishRequest()
            self.presenter?.didFailToFetchStatement(errorMessage)
        }
    }
    
    func manageFetchResponse(_ response: StatementsResponseStruct) {
        // Valida se dados retornados estão no formato correto
        var statementsList: [StatementsModels.StatementEntity] = []
        for statement in response.statementList {
            if let statementEntity = StatementsModels.StatementEntity(statement: statement) {
                statementsList.append(statementEntity)
            }
            else { break }
        }
        
        // Se estiver errado, exibe mensagem de erro
        guard statementsList.count == response.statementList.count else {
            if let errorMessage = BadRequestStruct(badRequest: response.error) {
                self.presenter?.didFailToFetchStatement("\(errorMessage.message!) (\(errorMessage.code!))")
            }
            else { self.presenter?.didFailToFetchStatement("Falha ao buscar statements") }
            return }
        
        
        self.statementsList = statementsList
        
        let presenterResponse = StatementsModels.Response(statementsList: statementsList)
        self.presenter?.presentFetchedStatements(response: presenterResponse)
    }
    
}

// MARK: - Access from View

extension StatementsInteractor: StatementsInteractorProtocol {
    func viewDidLoad() {
        presenter?.presentUserInfo(userInfo)
        
        fetchStatement()
    }
    
    func tryFetchAgain() {
        fetchStatement()
    }
    
    func logout() {
        // TODO: retornar para tela inicial
        
        // TODO: remover informações salvas localmente
    }
}
