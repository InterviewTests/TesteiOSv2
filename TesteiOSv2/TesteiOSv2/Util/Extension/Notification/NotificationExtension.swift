//
//  NotificationExtension.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

extension Notification.Name {
    
    //MARK: KEYBOARD
    static let keyobardWillShowNotification = Notification.Name("UIKeyboardWillShow")
    static let keyboardWillHideNotification = Notification.Name("UIKeyboardWillHide")
    static let keyboardWillChangeFrameNotification = Notification.Name("UIKeyboardWillChangeFrame")
}
