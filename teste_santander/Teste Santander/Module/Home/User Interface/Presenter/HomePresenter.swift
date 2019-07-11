//
//  HomePresenter.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterInput {
    
    weak var output: HomePresenterOutput?
    
    var wireframe: HomeWireframe
    
    var interactor: HomeInteractorInput
    
    var logggedInteractor: LoggedUserInteractorInput
    
    init(wireframe: HomeWireframe, interactor: HomeInteractorInput, logggedInteractor: LoggedUserInteractorInput) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.logggedInteractor = logggedInteractor
    }
    
    func viewDidLoad() {
       fetch()
    }
    
    func fetch() {
        if let user = logggedInteractor.loggedUser() {
            output?.startLoading()
            interactor.fetch(userID: user.userID)
        } else {
            shoudLogout()
        }
    }
    
    func shoudLogout() {
        logggedInteractor.logout()
    }
}

extension HomePresenter: HomeInteractorOutput, LoggedUserInteractorOutput {
    
    func fetchError(message: String) {
        output?.stopLoading()
    }
    
    func retry() {
        fetch()
    }
    
    func didLogout() {
       wireframe.showLogin()
    }
    
    func fecthed(items: [StatementItem]) {
        output?.stopLoading()
        var sections: [Section] = [Section]()
        
        if let user = logggedInteractor.loggedUser() {
            let sectionHeader = SectionHeader(item: user)
            sections.append(sectionHeader)
        }
        let _items = items.sorted(by: {$0.date.timeIntervalSince1970 >  $1.date.timeIntervalSince1970})
    
        _items.forEach { (item) in
            let sectionHeader = StatementSection(item: item)
            sections.append(sectionHeader)
        }
        
        output?.fetched(sections: sections)
    }
}
