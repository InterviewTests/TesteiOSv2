//
//  AlertManager.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 23/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

import UIKit

class AlertHelper {

    private init(){}
    
    static func showOkAlert(context: UIViewController, title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        
        context.present(alert, animated: true)
    }
    
}
