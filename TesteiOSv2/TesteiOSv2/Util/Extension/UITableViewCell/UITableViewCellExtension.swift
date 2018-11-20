//
//  UITableViewCellExtension.swift
//  WayTaxi
//
//  Created by Vinicius Minozzi on 08/05/17.
//  Copyright © 2017 WayTaxi. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class func createCell<T: UITableViewCell>(_ tableView: UITableView, indexPath: IndexPath) -> T {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            return T()
        }
        return cell
    }
}
