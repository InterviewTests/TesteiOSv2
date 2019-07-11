//
//  HomeViewControllerTeste.swift
//  Teste SantanderTests
//
//  Created by THIAGO on 11/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Quick
import Nimble

@testable import Teste_Santander

class HomeViewControllerTeste: QuickSpec {

    override func spec() {
        let viewController: HomeViewController = HomeWireframe().makeScreen(window: nil)
        
        beforeSuite {
            viewController.beginAppearanceTransition(true, animated: false)
        }
        
        describe("HomeViewControllerTest") {
            context("Verify sections") {
                it("Testing count Sections") {
                    expect(viewController.sections.count).toEventually(equal(10), timeout: 2.0)
                }
                
                it("Testing Section User") {
                    expect(viewController.sections.first).toEventually(beAKindOf(SectionHeader.self), timeout: 2.0)
                    
                    guard let section = viewController.sections.first as? SectionHeader else {
                        fail("Section not found")
                        return
                    }
                    expect(section.item.name).toEventually(equal("Jose da Silva Teste"), timeout: 2.0)
                    expect(section.item.userID).toEventually(equal(1), timeout: 2.0)
                    expect(section.item.balance).toEventually(equal(3.3445), timeout: 2.0)
                }
            }
        }
    }
}
