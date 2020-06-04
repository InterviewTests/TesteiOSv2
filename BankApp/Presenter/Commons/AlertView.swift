//
//  AlertView.swift
//  Presenter
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public struct AlertViewModel: Equatable {
    var title: String
    var message: String
}

public protocol AlertViewProtocol {
    var viewModel: AlertViewModel? { get set }
    func presentMessageWith(_ viewModel: AlertViewModel)
}
