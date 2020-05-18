//  Bank app
//
//  Created by mmalaqui
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit
//import NVActivityIndicatorView

//Base protocol
protocol BaseViewControllerRefresh {
    func refresh()
}

//Base Clasees
class BaseViewController: UIViewController{
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showLoader() {
        //TODO
    }
    
    func hideLoader() {
        // TODO
    }
    
    func showAlertWith(title: String, message: String, actions: NSArray?) {
        self.hideLoader()
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        if let actions = actions {
            for action in actions {
                if let actionToBeAdded = action as? UIAlertAction {
                    alert.addAction(actionToBeAdded)
                }
            }
        } else {
            alert.addAction(UIAlertAction(title: ("BaseViewController.Alert.Ok").localized, style: UIAlertAction.Style.default, handler: nil))
        }

        alert.view.tintColor = UIColor(red:0.78, green:0.82, blue:0.02, alpha:1.0)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithError(title: String, message: String, actions: NSArray?) {
        self.showAlertWith(title: title, message: message, actions: actions)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
}
