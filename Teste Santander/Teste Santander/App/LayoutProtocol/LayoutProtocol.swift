//
//  LayoutProtocol.swift
//  Teste Santander
//
//  Created by VM on 23/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

import Foundation

protocol LayoutProtocol: class {
    func setUpLayout()
    func addSubviews()
    func makeConstraints()
    func setUpNavigationBar()
}
