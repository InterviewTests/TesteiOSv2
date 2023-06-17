//
//  AutenticationRepository.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import Foundation

protocol AuthenticationRepositoryProtocol: AnyObject {
    func perform(login: BankApi.Endpoints,
                 with data: LoginRequestModel,
                 completion: @escaping (Result<UserAccountModel, UserFailure>) -> Void)
}
