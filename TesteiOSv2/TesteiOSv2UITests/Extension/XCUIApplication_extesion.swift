//
//  extesion.swift
//  TesteiOSv2UITests
//
//  Created by Felipe perius on 21/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//


import XCTest
extension XCUIApplication {
    func clearTextOnElement(_ element: XCUIElement) {
        element.doubleTap()
        menuItems["Select All"].tap()
        menuItems["Cut"].tap()
    }
}
