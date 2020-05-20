//
//  HomeInteractorModel.swift
//  Bank app
//
//  Created by mmalaqui on 19/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

//class that represents the interactor data
class HomeInteractorModel {
    var idHome: String?
    var user : HomeUserInteractorModel?
    
    init() {
        //TODO
    }
    
    init(homeDTO: HomeDTO?){
        if let homeDTO = homeDTO {
            self.user = HomeUserInteractorModel()
            self.user?.id = homeDTO.user?.id
            self.user?.name = homeDTO.user?.name
            self.user?.accountNumber = homeDTO.user?.accountNumber
            self.user?.agencyID = homeDTO.user?.agencyID
            self.user?.balance = homeDTO.user?.balance
        }
    }
}
class HomeUserInteractorModel {
    var id : Int?
    var name : String?
    var accountNumber : String?
    var agencyID : String?
    var balance : Float?
}
