//
//  BaseViewController.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var viewOrigin: CGPoint! = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGestureRecognizers()
        addKeyboardObservers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewOrigin = view.frame.origin
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UI
    func navigationBar(isHidden: Bool) {
        navigationController?.navigationBar.isHidden = isHidden
    }
    
    // MARK: Gestures
    private func addGestureRecognizers() {
        addDismissKeyboardGesture()
    }
    
    private func addDismissKeyboardGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    // MARK: Observers
    private func addObservers() {
        addKeyboardObservers()
    }
    
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:.keyobardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name:.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:.keyboardWillChangeFrameNotification, object: nil)
    }
    
    private func removeObservers() {
        NotificationCenter.default.removeObserver(self, name:.keyobardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name:.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name:.keyboardWillChangeFrameNotification, object: nil)
    }
    
    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name:.keyobardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name:.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name:.keyboardWillChangeFrameNotification, object: nil)
    }
    
    // MARK: Keyboard
    @objc func keyboardWillShow(_ notification: Notification) {
        
        let keyboardFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue
        let firstResponder = self.view.findFirstResponder()
        
        if firstResponder == nil {
            return
        }
        
        var firstResponderFrame = firstResponder!.frame
        
        if firstResponder!.superview != self.view {
            firstResponderFrame = self.view.convert(firstResponderFrame, from: firstResponder!.superview)
        }
        
        firstResponderFrame.origin.y += self.viewOrigin.y
        
        if firstResponderFrame.intersects(keyboardFrame!) {
            let maxY = keyboardFrame?.origin.y
            let actualY = firstResponderFrame.origin.y + firstResponderFrame.size.height + 24
            
            UIView.animate(withDuration: 0.05, animations: {
                
                var viewFrame = self.view.frame
                viewFrame.origin.y = -(actualY - maxY! - self.viewOrigin.y)
                self.view.frame = viewFrame
                
            })
        } else {
            UIView.animate(withDuration: 0.05, animations: {
                self.view.frame.origin = self.viewOrigin
            })
        }
    }
    
    @objc func keyboardWillHide(_ notifiation: Notification) {
        UIView.animate(withDuration: 0.05) {
            self.view.frame.origin = self.viewOrigin
        }
    }
    
    func keyboardWillChangeFrame(_ notification: Notification) {
        // Readjust the frame the same way when the keyboard shows for the first time
        keyboardWillShow(notification)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
