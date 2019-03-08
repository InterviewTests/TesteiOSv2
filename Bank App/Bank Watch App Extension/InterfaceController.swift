//
//  InterfaceController.swift
//  Bank Watch App Extension
//
//  Created by Chrystian Salgado on 08/03/19.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import WatchKit
import Foundation
import UIKit
import WatchConnectivity

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var lbName: WKInterfaceLabel!
    @IBOutlet weak var lbAgency: WKInterfaceLabel!
    @IBOutlet weak var lbAccount: WKInterfaceLabel!
    @IBOutlet weak var lbBalance: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        setup()
    }
    
    override func didAppear() {
        super.didAppear()
        let information: [String : Any] = ["data": "requestUserData"]
        WCSession.default.transferUserInfo(information)
    }
    
    private func setup() {
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
