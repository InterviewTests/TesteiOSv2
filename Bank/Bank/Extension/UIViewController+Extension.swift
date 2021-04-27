import UIKit
import Foundation

fileprivate var originalHeight: CGFloat?

extension UIViewController {
    
    @objc func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        
        if originalHeight == nil {
            originalHeight = self.view.frame.size.height
        }
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if let original = originalHeight {
                let height = original - keyboardSize.height
                self.view.frame = CGRect(x: self.view.frame.origin.x,
                                         y: self.view.frame.origin.y,
                                         width: self.view.frame.width,
                                         height: height)
            }
        }
    }
    
    @objc func keyboardWillHide() {
        if let height = originalHeight {
            self.view.frame = CGRect(x: self.view.frame.origin.x,
                                     y: self.view.frame.origin.y,
                                     width: self.view.frame.width,
                                     height: height)
        }
    }
}
