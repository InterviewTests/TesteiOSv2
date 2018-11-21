//
//  HomePresenter.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 20/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

protocol StatementListPresentationLogic {
    func presentStatements(response:HomeModel.Response)
}

class HomePresenter: StatementListPresentationLogic {
    weak var viewController: StatementOutput?
    
    func presentStatements(response: HomeModel.Response) {
        viewController?.displayStatements(viewModel:response)
    }
    
  
    
}
