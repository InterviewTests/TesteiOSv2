//
//  LoadinView.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 26/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit

class LoadinView: UIView {
    
    static let shared = LoadinView()
    var activity = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    
    class func start(){
        self.shared.show()
    }
    
    class func stop(){
        self.shared.remove()
    }
    
    convenience init(){
        self.init(frame: UIScreen.main.bounds)
    }
    
    func show() {
        self.configActivity()
        self.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(self)
        }
    }
    
    func remove()  {
        self.activity.stopAnimating()
        self.removeFromSuperview()
    }
    
    func configActivity(){
        activity.style = .whiteLarge
        activity.center = self.center
        activity.startAnimating()
        self.addSubview(activity)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
