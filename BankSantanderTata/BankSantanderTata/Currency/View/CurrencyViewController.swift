//
//  CurrencyViewController.swift
//  BankSantanderTata
//
//  Created on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import UIKit

final class CurrencyViewController: UIViewController {
    
    var presenter: CurrencyPresenterProtocol!
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAccessibilityIdentifiers()
        setupLabels()
        applyStyle()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    
    // MARK: - Setup Methods
    private func setupAccessibilityIdentifiers() {
        
    }
    
    private func setupLabels() {
        
    }
    
    private func applyStyle() {
        
    }
    
    @IBAction func logout(_ sender: Any) {
        presenter.logout()
    }
    
    
}

// MARK: - CurrencyViewProtocol
extension CurrencyViewController: CurrencyViewProtocol {
    
}
