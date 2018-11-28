//
//  CPFMailTextField.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 27/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit


public enum TextFieldFormatting {
    case uuid
    case socialSecurityNumber
    case phoneNumber
    case custom
    case noFormatting
    case cpf
}

class CPFMailTextField: UITextField, UITextFieldDelegate {
    
    public func setFormatting(_ formattingPattern: String, replacementChar: Character) {
        self.formattingPattern = formattingPattern
        self.replacementChar = replacementChar
        self.formatting = .custom
    }
    
    public var autoChangeFormat : Bool = false
    /**
     A character which will be replaced in formattingPattern by a number
     */
    public var replacementChar: Character = "*"
    
    /**
     A character which will be replaced in formattingPattern by a number
     */
    public var secureTextReplacementChar: Character = "\u{25cf}"
    
    /**
     True if input number is hexadecimal eg. UUID
     */
    public var isHexadecimal: Bool {
        return formatting == .uuid
    }
    
    /**
     Max length of input string. You don't have to set this if you set formattingPattern.
     If 0 -> no limit.
     */
    public var maxLength = 0
    
    /**
     Type of predefined text formatting. (You don't have to set this. It's more a future feature)
     */
    public var formatting : TextFieldFormatting = .noFormatting {
        didSet {
            switch formatting {
                
            case .socialSecurityNumber:
                self.formattingPattern = "***-**-****"
                self.replacementChar = "*"
                
            case .phoneNumber:
                self.formattingPattern = "***-***-****"
                self.replacementChar = "*"
                
            case .uuid:
                self.formattingPattern = "********-****-****-****-************"
                self.replacementChar = "*"
                
            case .cpf:
                self.formattingPattern = "***.***.***-**"
                self.replacementChar = "*"
                
            default:
                self.maxLength = 0
            }
        }
    }
    
    /**
     String with formatting pattern for the text field.
     */
    public var formattingPattern: String = "" {
        didSet {
            self.maxLength = formattingPattern.count
        }
    }
    
    /**
     Provides secure text entry but KEEPS formatting. All digits are replaced with the bullet character \u{25cf} .
     */
    public var formatedSecureTextEntry: Bool {
        set {
            _formatedSecureTextEntry = newValue
            super.isSecureTextEntry = false
        }
        
        get {
            return _formatedSecureTextEntry
        }
    }
    
    override public var text: String! {
        set {
            super.text = newValue
            textDidChange() // format string properly even when it's set programatically
        }
        
        get {
            if case .noFormatting = formatting {
                return super.text
            } else {
                // Because the UIControl target action is called before NSNotificaion (from which we fire our custom formatting), we need to
                // force update finalStringWithoutFormatting to get the latest text. Otherwise, the last character would be missing.
                textDidChange()
                return finalStringWithoutFormatting
            }
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        self.addTarget(self, action: #selector(textDidChange), for: UIControl.Event.editingChanged)

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.addTarget(self, action: #selector(textDidChange), for: UIControl.Event.editingChanged)

    }
    
    
    /**
     Final text without formatting characters (read-only)
     */
    public var finalStringWithoutFormatting : String {
        return _textWithoutSecureBullets.keepOnlyDigits(isHexadecimal: isHexadecimal)
    }
    
    // MARK: - INTERNAL
    fileprivate var _formatedSecureTextEntry = false
    
    // if secureTextEntry is false, this value is similar to self.text
    // if secureTextEntry is true, you can find final formatted text without bullets here
    fileprivate var _textWithoutSecureBullets = ""
    
    @objc public func textDidChange() {
        var superText: String { return super.text ?? "" }
        
        // TODO: - Isn't there more elegant way how to do this?
        let currentTextForFormatting: String
        
        if superText.count > _textWithoutSecureBullets.count {
            currentTextForFormatting = _textWithoutSecureBullets + superText[superText.index(superText.startIndex, offsetBy: _textWithoutSecureBullets.count)...]
        } else if superText.count == 0 {
            _textWithoutSecureBullets = ""
            currentTextForFormatting = ""
        } else {
            currentTextForFormatting = String(_textWithoutSecureBullets[..<_textWithoutSecureBullets.index(_textWithoutSecureBullets.startIndex, offsetBy: superText.count)])
        }
        
        if formatting != .noFormatting && currentTextForFormatting.count > 0 && formattingPattern.count > 0 {
            let tempString = currentTextForFormatting.keepOnlyDigits(isHexadecimal: isHexadecimal)
            
            var finalText = ""
            var finalSecureText = ""
            
            var stop = false
            
            var formatterIndex = formattingPattern.startIndex
            var tempIndex = tempString.startIndex
            
            while !stop {
                let formattingPatternRange = formatterIndex ..< formattingPattern.index(formatterIndex, offsetBy: 1)
                if formattingPattern[formattingPatternRange] != String(replacementChar) {
                    
                    finalText = finalText + formattingPattern[formattingPatternRange]
                    finalSecureText = finalSecureText + formattingPattern[formattingPatternRange]
                    
                } else if tempString.count > 0 {
                    
                    let pureStringRange = tempIndex ..< tempString.index(tempIndex, offsetBy: 1)
                    
                    finalText = finalText + tempString[pureStringRange]
                    
                    // we want the last number to be visible
                    if tempString.index(tempIndex, offsetBy: 1) == tempString.endIndex {
                        finalSecureText = finalSecureText + tempString[pureStringRange]
                    } else {
                        finalSecureText = finalSecureText + String(secureTextReplacementChar)
                    }
                    
                    tempIndex = tempString.index(after: tempIndex)
                }
                
                formatterIndex = formattingPattern.index(after: formatterIndex)
                
                if formatterIndex >= formattingPattern.endIndex || tempIndex >= tempString.endIndex {
                    stop = true
                }
            }
            
            _textWithoutSecureBullets = finalText
            
            let newText = _formatedSecureTextEntry ? finalSecureText : finalText
            if newText != superText {
                super.text = _formatedSecureTextEntry ? finalSecureText : finalText
            }
        }
        
        // Let's check if we have additional max length restrictions
        if maxLength > 0 {
            if superText.count > maxLength {
                super.text = String(superText[..<superText.index(superText.startIndex, offsetBy: maxLength)])
                _textWithoutSecureBullets = String(_textWithoutSecureBullets[..<_textWithoutSecureBullets.index(_textWithoutSecureBullets.startIndex, offsetBy: maxLength)])
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let field : CPFMailTextField = textField as! CPFMailTextField
        if range.location == 0 && autoChangeFormat {
            if (string.isNumberCharacter() == true) {
                field.formatting = .cpf
            } else {
                field.formatting = .noFormatting
            }
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
}

extension String {
    
    func keepOnlyDigits(isHexadecimal: Bool) -> String {
        let ucString = self.uppercased()
        let validCharacters = isHexadecimal ? "0123456789ABCDEF" : "0123456789"
        let characterSet: CharacterSet = CharacterSet(charactersIn: validCharacters)
        let stringArray = ucString.components(separatedBy: characterSet.inverted)
        let allNumbers = stringArray.joined(separator: "")
        return allNumbers
    }
    
    func isNumberCharacter() -> Bool {
        let characterset = CharacterSet(charactersIn: "0123456789")
        if self.rangeOfCharacter(from: characterset.inverted) == nil {
            return true
        }
        return false
    }
}


// Helpers
fileprivate func < <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func > <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}


