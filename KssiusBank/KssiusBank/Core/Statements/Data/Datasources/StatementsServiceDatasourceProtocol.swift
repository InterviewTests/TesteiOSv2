//
//  StatementsServiceDatasourceProtocol.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import Foundation

protocol StatementsServiceDatasourceProtocol {

    init(networkService: NetworkService<[StatementsModel]>)

    func fetch(statements: BankApi.Endpoints,  completion: @escaping (Result<[StatementsModel], BankFailure>) -> Void)
}
