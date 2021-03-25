//
//  varGlobal.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit

// MARK: - varGlobal -
var defaults = UserDefaults.standard
var displayLoadingV = UIView()

// MARK: - varColorl -
var uiColorBlack = UIColor.black
var uiColorGray = UIColor.gray
var uiColorLightGray = UIColor.lightGray
var uiColorRed = UIColor.red
var uiColorWhite = UIColor.white
var uicolorClear = UIColor.clear
var uiColorApp = UIColor(displayP3Red: 58.0/255.0, green: 73.0/255.0, blue: 238.0/255.0, alpha: 1.0)

// MARK: - varLogin -
var userEmailOrCPF = ""
var userPassword = ""
var userWSLogin : UserRoot?

// MARK: - varBankStatement -
var userWSStatementList : UserRootStatement?
var userWSStatementListCount = 0
