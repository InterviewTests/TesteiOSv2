//
//  Constants.swift
//  Santander
//
//  Created by ely.assumpcao.ndiaye on 08/01/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let BASE_URL = "https://bank-app-test.herokuapp.com/api"
let URL_LOGIN = "\(BASE_URL)/login"
let URL_STATEMENTS = "\(BASE_URL)/statements/1"

// Segues
let TO_CURRENCY = "toCurrency"


// User Defaults
let LOGGED_IN_KEY = "loggedIn"
let USER_NAME = "userName"
let USER_AGENCY = "userAgency"
let USER_BALANCE = "userBalance"
let USER_BANKACCOUNT = "userBankAccount"
let USER_ID = "userId"

let TITLE = "title"
let DESC = "desc"
let DATE = "date"
let VALUE = "value"


//Headers
let BEARER_HEADER = [
    "Content-Type": "application/x-www-form-urlencoded"
]
