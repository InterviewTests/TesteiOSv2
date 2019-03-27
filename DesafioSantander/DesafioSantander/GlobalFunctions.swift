//
//  GlobalFunctions.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 27/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import UIKit

func corner(in view: UIView, radius: Float) {
    view.layer.cornerRadius = CGFloat(radius)
}

func shadow(in view: UIView, color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat = 3) {
    view.layer.shadowColor = color.cgColor
    view.layer.shadowOffset = offset
    view.layer.shadowRadius = radius
    view.layer.shadowOpacity = opacity
}

// MARK: - HTTP

var acceptableStatusCodes: [Int] { return Array(200..<300) }

struct HTTPMethods {
    static let get = "GET"
    static let post = "POST"
    static let put = "PUT"
    static let delete = "DELETE"
}
