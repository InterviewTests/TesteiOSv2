//
//  MainTableViewDelegate.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

protocol MainTableViewDelegate: AnyObject {
    func reloadData()
    func showAlert(message: String)
}
