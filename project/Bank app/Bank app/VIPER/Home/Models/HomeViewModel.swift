//
//  HomeViewModel.swift
//  Bank app
//
//  Created by mmalaqui on 19/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of Home
class HomeViewModel {
    var idHome: String?
    var user : HomeViewUserModel?
    init() {}
    
    init(homeInteractorModel : HomeInteractorModel){
        self.user = HomeViewUserModel()
    
        self.user?.name = homeInteractorModel.user?.name
        self.user?.balance = homeInteractorModel.user?.balance
        self.user?.accountNumber = homeInteractorModel.user?.accountNumber
        
    }

}

class HomeViewUserModel {
    var name : String?
    var accountNumber : String?
    var balance : Float?
}
