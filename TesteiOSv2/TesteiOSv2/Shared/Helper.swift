//
//  Helper.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 08/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation
import UIKit

class Helper: NSObject {
    
    static func showAlert(title: String?, message: String? = nil, titleFirstButton: String, titleSecondButton: String? = nil, viewController: UIViewController,
                             callbackFirstButton:((UIAlertAction) -> Void)? = nil,
                             callbackSecondButton: ((UIAlertAction) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert )
        
        let firstAction = UIAlertAction.init(title: titleFirstButton, style: .default, handler: { alertAction in
            callbackFirstButton?(alertAction)
        })
        alert.addAction(firstAction)
        
        if let titleSecondButton = titleSecondButton {
            let secondAction = UIAlertAction.init(title: titleSecondButton, style: .default, handler: { alertAction in
                callbackSecondButton?(alertAction)
            })
            alert.addAction(secondAction)
        }
        
        viewController.present(alert, animated: true, completion: nil)

    }
    
    static func convertStringToDate(stringDate:String, format:String) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        guard let date:Date = dateFormatter.date(from: stringDate) else{
            return nil
        }
        
        return date
        
    }
    
    static func convertDateToString(date: Date, format:String) -> String {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        dateFormat.isLenient = true
        
        let dateString = dateFormat.string(from: date)
        
        return dateString
        
    }
    
}
