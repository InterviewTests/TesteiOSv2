//
//  TimelineViewController.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 03/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol TimelineDisplayLogic: AnyObject {
    func displayTransactionList(model: TimelineModels.Response)
}

class TimelineViewController: UIViewController {

    @IBOutlet private(set) weak var timelineView: TimelineView!
    
    var interactor: TimelineBusinessLogic?
    var coordinator: TimelineViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getTransactions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

}

extension TimelineViewController: TimelineDisplayLogic {
    func displayTransactionList(model: TimelineModels.Response) {
        timelineView.addTransactionList(list: model.timelineList)
    }
}
