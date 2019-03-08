//
//  InterfaceController.swift
//  Bank Watch App Extension
//
//  Created by Chrystian Salgado on 08/03/19.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var lbAccountTitle: WKInterfaceLabel!
    @IBOutlet weak var lbBalanceTitle: WKInterfaceLabel!
    @IBOutlet weak var lbName: WKInterfaceLabel!
    @IBOutlet weak var lbAccount: WKInterfaceLabel!
    @IBOutlet weak var lbBalance: WKInterfaceLabel!
    
    var agencyNumber: String = ""
    var accountNumber: String = ""
    
    var watchSession: WCSession? {
        didSet {
            if let session = watchSession {
                session.delegate = self
                session.activate()
            }
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        setup()
        setupUIElements()
    }
    
    override func didAppear() {
        super.didAppear()
    }
    
    private func setup() {
        watchSession = WCSession.default
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

extension InterfaceController {
    
    func setupUIElements() {
        lbAccountTitle.setText(NSLocalizedString("CONTA", tableName: nil, bundle: Bundle.main, value: "", comment: ""))
        lbBalanceTitle.setText(NSLocalizedString("SALDO", tableName: nil, bundle: Bundle.main, value: "", comment: ""))
    }
}

extension InterfaceController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if activationState == .activated {
            print("Conectivity recheaded")
        } else { print(error?.localizedDescription ?? "error" ) }
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        
        for pair in applicationContext {
            if pair.key == "name" {
                lbName.setText(stringCast(pair.value))
            } else if pair.key == "agency" {
                agencyNumber = stringCast(pair.value)
            } else if pair.key == "bankAccount" {
                accountNumber = stringCast(pair.value)
            } else if pair.key == "balance" {
                let balance = pair.value as! Double
                lbBalance.setText(balance.toStringCurrency())
            }
        }
        lbAccount.setText("\(accountNumber) / \(agencyNumber)")
    }
    
    private func stringCast(_ value: Any) -> String {
        if let stringValue = value as? String {
            return stringValue
        } else {
            return ""
        }
    }
}
