//
//  StatementMapper.swift
//  Teste SantanderTests
//
//  Created by THIAGO on 11/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Quick
import Nimble

@testable import Teste_Santander

class StatementMapper: QuickSpec {
    
    override func spec() {
        var statementListModel: StatementListModel!
        
        beforeSuite {
            guard let statementListMock: StatementListModel = Loader.mock(file: "StatementList") else {
                fail("The JSON file does not exist")
                return
            }
            
            statementListModel = statementListMock
        }
        describe("StatementTests") {
            
            context("Testing mapper") {
                it("Is Type StatementEntity") {
                    let entitys = statementListModel.statementList.map({ StatementEntity.make(model: $0)})
                    expect(entitys.count).to(equal(9))
                }
                
                it("Is Type StatementItem") {
                    let entitys = statementListModel.statementList.map({ StatementEntity.make(model: $0)})
                    let items = entitys.map({ StatementItem.make(entity: $0) })
                    expect(items.count).to(equal(9))
                }
                
                it("Is Type StatementItem") {
                    let entitys = statementListModel.statementList.map({ StatementEntity.make(model: $0)})
                    let items = entitys.map({ StatementItem.make(entity: $0) })
                    let display = items.map({ StatementDisplay.make(item: $0)})
                    
                    expect(display.count).to(equal(9))
                }
            }
        }
    }
}
