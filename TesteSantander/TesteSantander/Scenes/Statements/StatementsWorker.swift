//
//  StatementsWorker.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

import UIKit

typealias FetchStatementResponseSuccess = (_ response: StatementsModel.Fetch.Response) -> ()
typealias FetchStatementResponseFailure = (_ response: String) -> ()

class StatementsWorker {
    func fetchStatements(completionSuccess: @escaping FetchStatementResponseSuccess, completionFailure: @escaping FetchStatementResponseFailure) {
        guard let url = URL(string: Constants.Url.statements) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completionFailure(error?.localizedDescription ?? "")
                return
            }
            
            guard let statements = StatementList.parse(responseData: data) else {
                completionFailure(error?.localizedDescription ?? "")
                return
            }
            
            completionSuccess(StatementsModel.Fetch.Response(statements: statements))
        }.resume()
    }
}
