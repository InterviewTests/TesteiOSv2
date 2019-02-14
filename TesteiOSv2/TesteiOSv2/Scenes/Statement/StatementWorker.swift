//
//  StatementWorker.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 08/02/2019.
//  Copyright (c) 2019 Accenture. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

//MARK: - Class body
class StatementWorker{

    //MARK: - Functions
    func getStatements(success: @escaping (StatementListModel)->Void, failure : @escaping (NSError)-> Void) {
        
        let httpServiceRequest : HTTPServiceRequest<StatementListModel> = HTTPServiceRequest()
        httpServiceRequest.getRequest(success: { (response) in
            guard let statements = response else {
                return
            }
            success(statements)
        }, failure: { (error) in
            
        }, servicePath: .STATEMENTS_PATH)

    }
    
    func clearCredentials(){
        KeychainManager.shared.clearCredentials()
    }
}
