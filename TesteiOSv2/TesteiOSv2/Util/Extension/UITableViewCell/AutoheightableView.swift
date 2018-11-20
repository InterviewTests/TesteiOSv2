//
//  AutoheightableView.swift
//  desafio-concrete
//
//  Created by Felipe Perius on 06/01/18.
//  Copyright © 2018 Vergil. All rights reserved.
//

import UIKit

protocol AutoheightableView: class {
  
    static var cellHeight: CGFloat { get }
}
