//
//  LoadView.swift
//  Bank
//
//  Created by Administrador on 28/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import UIKit

class ModalView {

    static func showModalView(viewController: UIViewController, text: String) {
        DispatchQueue.main.async {
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = viewController.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            let activityIndicator = UIActivityIndicatorView.init(style: .whiteLarge)
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            activityIndicator.startAnimating()
            
            blurEffectView.contentView.addSubview(activityIndicator)
            activityIndicator.center = blurEffectView.contentView.center
            
            let lblText = UILabel(frame: CGRect.init(x: 0, y: activityIndicator.frame.origin.y + activityIndicator.frame.size.height, width: viewController.view.frame.width, height: 20))
            lblText.font = UIFont.init(name: "Helvetica Neue Light", size: 17)
            lblText.textColor = .white
            lblText.textAlignment = .center
            lblText.text = text
            blurEffectView.contentView.addSubview(lblText)
            
            viewController.view.addSubview(blurEffectView)
        }
    }
    
    static func hiddenModalView(viewController: UIViewController){
        DispatchQueue.main.async {
            viewController.view.subviews.compactMap {  $0 as? UIVisualEffectView }.forEach {
                $0.removeFromSuperview()
            }
        }
    }

}
