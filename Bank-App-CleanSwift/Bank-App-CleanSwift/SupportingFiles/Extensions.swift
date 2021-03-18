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
    func hideNavigationBar(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    /// Shows the tite bar of `NavigationController`
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
