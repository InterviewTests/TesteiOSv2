//
//  ChangeStatusBarBackgroundColorTests.swift
//  Bank AppTests
//
//  Created by Chrystian (Pessoal) on 19/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import XCTest
@testable import Bank_App

class ChangeStatusBarBackgroundColorTests: XCTestCase {
    
    var viewController: UIViewController?

    override func setUp() {
        self.viewController = UIViewController()
    }

    func testChangeStatusBarBackgroundColor() {
        if let _ = viewController {
            viewController!.setStatusBarStyle(.lightContent, backgroundColor: .blue)
            
            if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
                XCTAssertEqual(statusBar.backgroundColor, UIColor.blue)
            }
            else {
                XCTFail("Erro ao instânciar o view controller")
            }
        }
        else {
            XCTFail("Erro ao instânciar o view controller")
        }
    }
}
