//
//  UserInterfaceTests.swift
//  UserInterfaceTests
//
//  Created by Estaife Lima on 05/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
@testable import UserInterface

import UIKit

class LoginViewControllerTests: XCTestCase {

    func testifHiddenLoadingViewWhenStart() throws {
        //Given
        let sut = LoginViewController()
        
        //When
        sut.loadViewIfNeeded()
        
        //Then
        XCTAssertEqual(sut.isLoading, false)
    }
}
