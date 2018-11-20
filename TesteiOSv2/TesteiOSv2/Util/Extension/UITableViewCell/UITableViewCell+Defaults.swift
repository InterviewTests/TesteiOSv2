//
//  UITableViewCell+CellHeight.swift
//  desafio-concrete
//
//  Created by Felipe Perius on 04/01/18.
//  Copyright © 2018 Vergil. All rights reserved.
//

import UIKit

extension AutoheightableView where Self: UITableViewCell {
    static var cellHeight: CGFloat {
        return 44.0
    }
}

extension ReusableView where Self: UITableViewCell {
    
    static var defaultReuseIdentifier: String {
        return className
    }
}

extension NibLoadableView where Self: UIView {
    
    static var defaultNibName: String {
        return className
    }
    
    static var viewFromDefaultNib: Self? {
        return Bundle.main.loadNibNamed(defaultNibName, owner: nil, options: nil)?.first as? Self
    }
    
    func loadNib() {
        
        let nibName = Self.defaultNibName
        if let view = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView {
            
            view.bounds = self.bounds
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate(
                [view.topAnchor.constraint(equalTo: self.topAnchor),
                 view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                 view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                 view.bottomAnchor.constraint(equalTo: self.bottomAnchor)]
            )
        }
    }
}

extension UIView: NibLoadableView { }

extension UITableViewCell: ReusableView, AutoheightableView { }
