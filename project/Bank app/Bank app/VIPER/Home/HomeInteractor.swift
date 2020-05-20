//
//  HomeInteractor.swift
//  Bank app
//
//  Created by mmalaqui on 19/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

protocol HomeInteractorProtocol: AnyObject {
    var homeInteractorModel : HomeInteractorModel? {get set}
    var homeDTO: HomeDTO? {get set}

    func getHomeData(completion: @escaping(_ homeModelEntity : HomeInteractorModel) -> Void)
    func cleanup()
}

final class HomeInteractor: BaseInteractor<HomePresenterProtocol>, HomeInteractorProtocol {
    var InteractorID = "HomeInteractor"
    var homeInteractorModel : HomeInteractorModel?
    var homeDTO: HomeDTO? {
        didSet{
            self.homeInteractorModel = HomeInteractorModel(homeDTO: homeDTO)
        }
    }
    
    var cdlStatements = CDLStatements()
    
    func getHomeData(completion: @escaping(_ homeModelEntity : HomeInteractorModel) -> Void) {
         if let homeInteractorModel = homeInteractorModel {
            if let userID = homeInteractorModel.user?.id {
                cdlStatements.getStatements(subscriber : (self.InteractorID, { ( response: CDLResponse? ) -> Void in
                        //TODO
                    completion(homeInteractorModel)
                    return
                }), userID: userID)

            }else{
                self.homeInteractorModel?.error = .noUserError
                completion(homeInteractorModel)
                return
            }
         }else{
            self.homeInteractorModel = HomeInteractorModel()
            self.homeInteractorModel?.error = .noUserError
            completion(self.homeInteractorModel!)
            return
        }
    }
    
    
    func cleanup(){
        cdlStatements.cleanup(subscriberID: InteractorID)
    }
}
