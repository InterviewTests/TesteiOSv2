//
//  CallfFeedBack.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 17/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation
import UIKit
class CallFeedBack{
    
    func feedbackError(error: String)->UIAlertController{
        let alert = UIAlertController(title: "Alerta", message: error, preferredStyle:  UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style:  UIAlertAction.Style.default){
            UIAlertAction in
        })
        return alert
    }
}
