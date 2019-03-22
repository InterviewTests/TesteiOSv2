//
//  StatementsModels.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 18/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation
import UIKit

enum Statements
{
    // MARK: Use cases
    
    enum fetchStatements
    {
        struct Request
        {
            var id: String
//               var title: String? = nil
        }
        struct Response
        {
            let StatementsResponse: StatementsModel?
            let UserResponse: UserModel?
            let message: String?
        }
        struct ViewModel
        {
            struct DisplayViewModel {
                let title:String
                let desc:String
                let date: String
                let value: String
            }
           
            var displayStatements: [DisplayViewModel] = []
            
        }
    }
}
