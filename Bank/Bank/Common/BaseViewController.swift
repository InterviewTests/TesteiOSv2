//
//  ProgressActivityIndicator.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 19/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit
import IHProgressHUD

class BaseViewController: UIViewController {
    
    func startProgress() {
        DispatchQueue.main.async {
            IHProgressHUD.set(defaultMaskType: .black)
            IHProgressHUD.show()
            IHProgressHUD.set(viewForExtension: self.view)
            IHProgressHUD.set(foregroundColor: UIColor(hex6: 0x3F40EE))
        }
    }
    
    func closeProgress() {
        DispatchQueue.main.async {
            IHProgressHUD.dismiss()
        }
    }
}
