//
//  NetworkLayerTests.swift
//  TestSantander-IBMTests
//
//  Created by Erika Albizzati on 28/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import XCTest
@testable import TestSantander_IBM

class NetworkLayerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func loadJsonMockData(name: String, type: String) throws -> Data? {
        let bundle = Bundle(for: Swift.type(of: self))
        
        if let path = bundle.path(forResource: name, ofType: type) {
            let json = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return json.data(using: .utf8)
        }
        
        return nil
    }

    func testParsingJsonToClass() {
        do {
            if let data = try self.loadJsonMockData(name: "login", type: "json"),
                let api: ApiResponse = try NetworkManager.parseJsonDataToClass(data) {
                self.testApiReturnForLogin(api)
            } else {
                XCTFail("Error loading from local json file")
            }

            if let data = try self.loadJsonMockData(name: "statements", type: "json"),
                let api: ApiResponse = try NetworkManager.parseJsonDataToClass(data) {
                self.testApiReturnForStatements(api)
            } else {
                XCTFail("Error loading from local json file")
            }
        }catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    
    func testApiFetchLoginData() {
        let networkManager = NetworkManager()
        networkManager.fetchAccountData(req: LoginScene.PostLogin.Request(user: "ealbizzati@gmail.com", password: "hG%")) { (api: ApiResponse?, err) in
            XCTAssertNil(err)
            XCTAssertNotNil(api)
            self.testApiReturnForLogin(api)
        }
    }
    
    func testApiFetchStatementData() {
        let networkManager = NetworkManager()
        let userId = 1
        networkManager.fetcStatementsData(req: StatementListScene.GetStatements.Request(id: userId)) { (api: ApiResponse?, err) in
            XCTAssertNil(err)
            XCTAssertNotNil(api)
            self.testApiReturnForStatements(api)
        }
    }
    
    func testApiReturnForLogin(_ api: ApiResponse?){
        XCTAssertEqual(api?.userAccount?.userId, 1)
        XCTAssertEqual(api?.userAccount?.name, "Jose da Silva Teste")
        XCTAssertEqual(api?.userAccount?.bankAccount, "2050")
        XCTAssertEqual(api?.userAccount?.agency, "012314564")
        XCTAssertEqual(api?.userAccount?.balance, 3.3445)
        let err = ErrorModel(code: nil, message: nil)
        XCTAssertEqual(api?.error!.code, err.code)
        XCTAssertEqual(api?.error!.message, err.message)
    }
    
    func testApiReturnForStatements(_ api: ApiResponse?){
        XCTAssertEqual(api?.statementList?.count, 9)
        if let result = api?.statementList![0] {
            XCTAssertEqual(result.title, "Pagamento")
            XCTAssertEqual(result.desc, "Conta de luz")
            XCTAssertEqual(result.date, "2018-08-15")
            XCTAssertEqual(result.value, -50)

            let err = ErrorModel(code: nil, message: nil)
            XCTAssertEqual(api?.error!.code, err.code)
            XCTAssertEqual(api?.error!.message, err.message)
        }
    }
}
