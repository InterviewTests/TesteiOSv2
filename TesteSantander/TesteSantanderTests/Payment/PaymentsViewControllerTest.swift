//
//  PaymentsViewControllerTest.swift
//  TesteSantanderTests
//
//  Created by Henrique Pereira de Lima on 28/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit
import Quick
import Nimble

@testable import TesteSantander

class PaymentsViewControllerTest: QuickSpec {
    
    var controller: PaymentsViewController!
    var mock : ResponseTransactions?
    override func spec() {
        describe("PaymentsViewController"){
        beforeEach {
            self.controller = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PaymentsViewController") as! PaymentsViewController)
            _ = self.controller.view
            
            let json = """
            {
            "statementList": [
            {
            "title": "Pagamento",
            "desc": "Conta de luz",
            "date": "2018-08-15",
            "value": -50
            },
            {
            "title": "TED Recebida",
            "desc": "Joao Alfredo",
            "date": "2018-07-25",
            "value": 745.03
            },
            {
            "title": "DOC Recebida",
            "desc": "Victor Silva",
            "date": "2018-06-23",
            "value": 399.9
            },
            ]
            }
            """.data(using: .utf8)!
            self.mock = try! JSONDecoder().decode(ResponseTransactions.self, from: json)
            self.controller.transactionsList = self.mock!.statementList
        }
            
            it("should have 8 movies loaded"){
                expect(self.controller.tableView.numberOfRows(inSection: 0)).to(equal(3))
            }
    }
    }
}


struct Swifter: Decodable {
    let fullName: String
    let id: Int
    let twitter: URL
}

//let json = """
//{
// "fullName": "Federico Zanetello",
// "id": 123456,
// "twitter": "http://twitter.com/zntfdr"
//}
//""".data(using: .utf8)! // our data in native (JSON) format
//let myStruct = try JSONDecoder().decode(Swifter.self, from: json)
