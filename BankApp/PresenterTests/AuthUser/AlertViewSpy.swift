//
//  AlertViewSpy.swift
//  PresenterTests
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation
import Presenter

public class AlertViewSpy: AlertViewProtocol {
    public var viewModel: AlertViewModel?
    
    public func presentMessageWith(_ viewModel: AlertViewModel) {
        self.viewModel = viewModel
    }
}
