//
//  FeedBack.swift
//  TesteiOSSantander
//
//  Created by Gersinho on 21/12/18.
//  Copyright © 2018 julio.c.tanchiva. All rights reserved.
//

import Foundation
import UIKit

class FeedBack{
    static let shared = FeedBack()
    
    func feedbackError()->UIAlertController{
        let alert = UIAlertController(title: "Alerta", message: "Senha Invalida", preferredStyle:  UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style:  UIAlertAction.Style.default){
            UIAlertAction in
        })
        return alert
    }
}
