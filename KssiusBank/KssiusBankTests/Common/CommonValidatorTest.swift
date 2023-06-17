//
//  CommonValidateTest.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 16/06/23.
//

import XCTest
@testable import KssiusBank

final class CommonValidatorTest: XCTestCase {
    
}

// MARK: - CPF Tests
extension CommonValidatorTest {

    // MARK: - Success CPF Authentication Response

    func testSuccessCpf() {
        XCTAssertTrue(CommonValidator.User.isCpf(Seeds.cpf))
    }


    // MARK: - Failure CPF Authentication

    func testFailureCpf() {
        XCTAssertFalse(CommonValidator.User.isCpf("331.876.789.90"))
    }
}

// MARK: - Email Tests
extension CommonValidatorTest {

    // MARK: - Success Email Authentication Response

    func testSuccessEmail() {
        XCTAssertTrue(CommonValidator.User.isEmail(Seeds.email))
    }


    // MARK: - Failure Email Authentication

    func testFailureEmailDomain() {
        XCTAssertFalse(CommonValidator.User.isEmail("teste@testecom"))
    }

    // MARK: - Failure Email Authentication

    func testFailureEmailDomainDot() {
        XCTAssertFalse(CommonValidator.User.isEmail("teste@testecom."))
    }

    // MARK: - Failure Email Authentication

    func testFailureEmailUser() {
        XCTAssertFalse(CommonValidator.User.isEmail("teste @teste.com"))
    }
}

// MARK: - Password Tests

extension CommonValidatorTest {

    // MARK: - Success Password Authentication

    func testSuccessPassword() {
        XCTAssertTrue(CommonValidator.User.validatePassword(Seeds.password))
    }

    // MARK: - Failure Password Special char Authentication

    func testFailurePasswordSpecialCharResponse() {
        XCTAssertFalse(CommonValidator.User.validatePassword("Tato123"))
    }

    // MARK: - Failure Password Upper char Authentication

    func testFailurePasswordUpperCharResponse() {
        XCTAssertFalse(CommonValidator.User.validatePassword("t@to123"))
    }

    // MARK: - Failure Password Number Authentication

    func testFailurePasswordNumberResponse() {
        XCTAssertFalse(CommonValidator.User.validatePassword("T@toBAC"))
    }

    // MARK: - Failure Password Alpha char Authentication

    func testFailurePasswordAlphaResponse() {
        XCTAssertFalse(CommonValidator.User.validatePassword("%@45123"))
    }
}
