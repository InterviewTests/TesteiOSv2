//
//  StatementsRepository.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import Foundation

protocol StatementsRepositoryProtocol: AnyObject {
    func fetch(statements: BankApi.Endpoints,
                 completion: @escaping (Result<[StatementsModel], StatementsFailure>) -> Void)
}
