//
//  DefaultAlert.swift
//  Passageiro
//
//  Created by Voll on 09/02/2018.
//  Copyright © 2018 Jigs. All rights reserved.
//

import UIKit

typealias CallBackActionButton = ()  -> Void

extension UIAlertController {
    
    @objc class func showAlertAttention(msg: String, view: UIViewController) {
        let alert = UIAlertController(title: "titelAlertAttention".localized, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
    
    
    @objc class func showAlertAttention(msg: String, view: UIViewController, callBackActionButton: @escaping CallBackActionButton) {
        let alert = UIAlertController(title: "titelAlertAttention".localized, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            callBackActionButton()
        }))
        
        view.present(alert, animated: true, completion: nil)
    }
    
    
    @objc class func showAlertAttention(msg: String, view: UIViewController, titleOKButton: String, titleCancelButton: String, callBackOkButton: @escaping CallBackActionButton) {
        let alert = UIAlertController(title: "titelAlertAttention".localized, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: titleCancelButton, style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: titleOKButton, style: UIAlertAction.Style.default, handler: { _ in
            callBackOkButton()
        }))
        
        view.present(alert, animated: true, completion: nil)
    }
}
