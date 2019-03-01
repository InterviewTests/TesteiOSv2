//
//  XCUIElement+Extensions.swift
//  TesteiOSv2UITests
//
//  Created by Marcel Mendes Filho on 01/03/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import XCTest

extension XCUIElement {
    /**
     Removes any current text in the field before typing in the new value
     - Parameter text: the text to enter into the field
     */
    func clearAndEnterText(text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }
        
        self.tap()
        
        let deleteString = stringValue.characters.map { _ in "\u{8}" }.joined(separator: "")
        
        self.typeText(deleteString)
        self.typeText(text)
    }
}
