//
//  UITextField+AMSetPicker.swift
//  AMTextFieldPickerExtension
//
//  Created by Anthony Miller on 6/24/15.
//  Copyright (c) 2015 Anthony Miller. All rights reserved.
//

import UIKit

/**
 *  This extension to `UITextField` allows you to set a `UIPickerView` to the `pickerView` property to set the given `UIPickerView` as the `inputView` for the `UITextField`
 
 :discussion: Setting the `pickerView` for the text field will also set up a `UIToolbar` with a "Done" button as the text field's `inputAccessoryView`. When pressed, the "Done" button will set the text field's text from the `pickerView`'s `delegate`.
 */
public extension UITextField {
    
    fileprivate struct AssociatedKeys {
        static var DateFormatter = "am_DateFormat"
        static var ShowClearButton = "am_ShowClearButton"
        static var ClearButtonTitle = "am_ClearButtonTitle"
    }
    
    /// The `UIPickerView` for the text field. Set this to configure the `inputView` and `inputAccessoryView` for the text field.
    public var pickerView: UIPickerView? {
        get {
            return self.inputView as? UIPickerView
        }
        set {
            setInputViewToPicker(newValue)
        }
    }
    
    /// The `UIDatePicker` for the text field. Set this to configure the `inputView` and `inputAccessoryView` for the text field.
    public var datePicker: UIDatePicker? {
        get {
            return self.inputView as? UIDatePicker
        }
        set {
            setInputViewToPicker(newValue)
        }
    }
    
    fileprivate func setInputViewToPicker(_ picker: UIView?) {
        self.inputView = picker
        self.inputAccessoryView = picker != nil ? pickerToolbar() : nil
    }
    
    fileprivate func refreshPickerToolbar() {
        self.inputAccessoryView = hasPicker() ? pickerToolbar() : nil
    }
    
    fileprivate func hasPicker() -> Bool {
        return pickerView != nil || datePicker != nil
    }
    
    fileprivate func pickerToolbar() -> UIToolbar {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = createDoneButton()
        
        var toolbarItems = [flexibleSpace, doneButton]
        
        if showPickerClearButton {
            toolbarItems.insert(createClearButton(), at: 0)
        }
        
        toolbar.items = toolbarItems
        
        return toolbar
    }
    
    fileprivate func createDoneButton() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .done,
                               target: self,
                               action: #selector(UITextField.didPressPickerDoneButton(_:)))
    }
    
    fileprivate func createClearButton() -> UIBarButtonItem {
        return UIBarButtonItem(title: clearButtonTitle,
                               style: .plain,
                               target: self,
                               action: #selector(UITextField.didPressPickerClearButton(_:)))
    }
    
    /// The `NSDateFormatter` to use to set the text field's `text` when using the `datePicker`.
    /// Defaults to a date formatter with date format: "M/d/yy".
    public var dateFormatter: DateFormatter {
        get {
            if let formatter = objc_getAssociatedObject(self, &AssociatedKeys.DateFormatter) as? DateFormatter {
                return formatter
            } else {
                let formatter = DateFormatter()
                formatter.dateFormat = "M/d/yy"
                objc_setAssociatedObject(self, &AssociatedKeys.DateFormatter, formatter, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return formatter
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.DateFormatter, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// If set to `true` the `inputAccessoryView` toolbar will include a button to clear the text field.
    /// Defaults to `false`.
    public var showPickerClearButton: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.ShowClearButton) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.ShowClearButton, newValue as Bool, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            refreshPickerToolbar()
        }
    }
    
    /// The title to display for the clear button on the `inputAccessoryView` toolbar.
    /// Defaults to "Clear".
    public var clearButtonTitle: String {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.ClearButtonTitle) as? String ?? "Clear"
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.ClearButtonTitle, newValue as NSString, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /**
     This method is called when the "Done" button on the `inputAccessoryView` toolbar is pressed.
     
     :discussion: This method will set the text field's text with the title for the selected row in the `pickerView` in component `0` from the `pickerView`'s `delegate.
     
     - parameter sender: The "Done" button sending the action.
     */
    @objc public func didPressPickerDoneButton(_ sender: AnyObject) {
        guard pickerView != nil || datePicker != nil else { return }
        
        if pickerView != nil {
            setTextFromPickerView()
            
        } else if datePicker != nil {
            setTextFromDatePicker()
        }
        DispatchQueue.main.async(execute: { () -> Void in
            self.sendActions(for: .editingChanged)
        })
        resignFirstResponder()
    }
    
    fileprivate func setTextFromPickerView() {
        if let selectedRow = pickerView?.selectedRow(inComponent: 0),
            let title = pickerView?.delegate?.pickerView?(pickerView!, titleForRow: selectedRow, forComponent: 0) {
            self.text = title
        }
    }
    
    fileprivate func setTextFromDatePicker() {
        if let date = datePicker?.date {
            self.text = self.dateFormatter.string(from: date)
        }
    }
    
    /**
     This method is called when the clear button on the `inputAccessoryView` toolbar is pressed.
     
     :discussion: This method will set the text field's text to `nil`.
     
     - parameter sender: The clear button sending the action.
     */
    @objc public func didPressPickerClearButton(_ sender: AnyObject) {
        self.text = nil
        DispatchQueue.main.async(execute: { () -> Void in
            self.sendActions(for: .editingChanged)
        })
        resignFirstResponder()
    }
    
}
