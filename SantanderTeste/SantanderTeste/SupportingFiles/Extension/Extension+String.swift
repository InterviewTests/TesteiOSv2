//
//  Extension+String.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 17/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation
import UIKit
extension String{
    
    func removeChacter()->String{
        return self.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "-", with: "")
    }

        
    func formatStringDate()->String{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            if let date = dateFormatter.date(from: self){
                print(date)
                
                let displayFormater = DateFormatter()
                displayFormater.locale = Locale(identifier: "pt_BR")
                displayFormater.dateStyle = .long
                return displayFormater.string(from: date)
            }
            return self
        }

}
