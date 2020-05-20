//
//  HomePresenter.swift
//  Bank app
//
//  Created by mmalaqui on 19/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

protocol HomePresenterProtocol: AnyObject {
    var viewModel: HomeViewModel? { get set }
    func homeViewDidLoad()
    func cleanup()
}

final class HomePresenter: BasePresenter<HomeView, HomeRouterProtocol, HomeInteractorProtocol>, HomePresenterProtocol {
    var viewModel: HomeViewModel?
    

    func homeViewDidLoad() {
        self.view?.showLoader()
        
        self.interactor?.getHomeData(completion: { (homeInteractorModel:HomeInteractorModel?, error: HomeInteractorError?) -> Void in
            if let homeInteractorModel = homeInteractorModel {
                self.viewModel = HomeViewModel(homeInteractorModel: homeInteractorModel)
                DispatchQueue.main.async {
                    //Update header section
                    self.view?.accountNumberLabel.text = self.viewModel?.user?.accountNumber
                    if let balance = self.viewModel?.user?.balance{
                        self.view?.balanceValueLabel.text = balance
                    }else{
                        self.view?.balanceValueLabel.text = "-" // default display value in case of a error
                    }
                    self.view?.usernameLabel.text = self.viewModel?.user?.name
                    
                    //Update list
                    self.view?.tableview?.reloadData()
                    
                    self.view?.hideLoader()
                }
            }else{
                //TODO handle error
            }
        })
    }
    
    
    func cleanup(){
        self.interactor?.cleanup()
    }
}
