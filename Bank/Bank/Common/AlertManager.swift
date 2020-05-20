//
//  AlertManager.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 19/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit
import SwiftMessages

class AlertManager {
    
    func showAlertController(body: String, title: String, theme: Theme) {
        let alert = MessageView.viewFromNib(layout: .cardView)
        alert.configureTheme(theme)
        alert.configureDropShadow()
        alert.configureContent(title: title, body: body)
        alert.button?.isHidden = true
        var alertConfig = SwiftMessages.defaultConfig
        alertConfig.duration = .seconds(seconds: 4)
        alertConfig.presentationStyle = .top
        alertConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        SwiftMessages.show(config: alertConfig, view: alert)
    }
    
    
}
