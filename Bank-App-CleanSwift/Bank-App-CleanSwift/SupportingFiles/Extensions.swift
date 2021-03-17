//
//  Extensions.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 17/03/21.
//

import Foundation
import UIKit

// MARK: - Extension for all view controllers.
extension UIViewController {
    /// Hides the title bar of `NavigationController`
    /// - Parameter animated: `true` if the action is animated, `false` otherwise.
    func hideNavigationBar(animated: Bool){
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

    }
    
    /// Shows the tite bar of `NavigationController`
    /// - Parameter animated: `true` if the action is animated, `false` otherwise.
    func showNavigationBar(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
