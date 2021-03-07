//
//  Constants.swift
//  BankApp
//  Struct containing some of constanst of the application aka. endpoint strings, username for developing and testing purposes.
//
//  Created by Adriano Rodrigues Vieira on 02/03/21.
//

import Foundation
import Alamofire
import UIKit

// MARK: -
/// Constants for use in HTTP requests. It contains urls, methods verb and headers.
struct REQUESTS {
    static let LOGIN_ENDPOINT = "https://bank-app-test.herokuapp.com/api/login/"
    static let STATEMENTS_ENDPOINT = "https://bank-app-test.herokuapp.com/api/statements/"
    static let HEADERS: HTTPHeaders = [
        .contentType("application/json; charset=utf-8")
    ]
    
    static let POST_METHOD: HTTPMethod = .post
    static let GET_METHOD: HTTPMethod = .get    
}

// MARK: -
/// Constants for testing purposes.
struct TESTING_DATA {
    static let USER = "test_user"
    static let PASSWORD = "Test@1"
    static let USER_ID = 1
    
    static let USER_PARAMETERS = UserLoginCredentialsParameters(user: USER, password: PASSWORD)
    static let VALID_CPF = "231.481.700-16"
    static let VALID_CPF_WITH_NO_POINTS_AND_DASH = "23148170016"
    static let INVALID_CPF_NUMBERS_EQUAL = "111.111.111-11"
    static let INVALID_CPF_MISSING_NUMBER = "231.481.700-1"
    static let INVALID_CPF_JUNK_TEXT = "Mombojombo"
    static let INVALID_CPF_WRONG_SEQUENCE_NUMBER = "231.481.700-15"
    
    static let VALID_EMAIL = "joao.sembraco@outlook.com"
    static let INVALID_EMAIL = "mombojombo"
    
    static let VALID_PASSWORD = "Test5!"
    static let VALID_PASSWORD_MORE_THAN_SIX_DIGITS = "i_Am_1_Long_Password_with_2_numbers!!!@#$%"
    static let INVALID_PASSWORD_FIVE_DIGITS = "Tes5!"
    static let INVALID_PASSWORD_NO_NUMBER = "Testi!"
    static let INVALID_PASSWORD_NO_CHARACTER = "Test51"
    static let INVALID_PASSWORD_NO_CAPITALIZED = "test5!"
    static let INVALID_PASSWORD_BLANK = ""        
}

// MARK: -
/// Constants for use in regex matches.
struct REGEX_PATTERNS {
    static let CPF = "[0-9]{3}\\.?[0-9]{3}\\.?[0-9]{3}\\-?[0-9]{2}"
    static let EMAIL = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let PASSWORD = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}$"
}

// MARK: -
/// Constants for Alerts. Represents the title, the label, and some custom phrases.
struct ALERT_LABELS {
    static let TITLE = "Algo estranho ocorreu..."
    static let ACTION_BUTTON_TITLE = "Vou verificar!"
    
    static let INITIAL = "Parece que:\n\n"
    static let USER_INVALID = "O usuário informado não está no padrão CPF ou email\n"
    static let PASSWORD_INVALID = "A senha informada não possui o padrao: no mínimo 6 dígitos, sendo ao menos 1 caracter especial, uma letra maiúscula e um número\n"
    
    static let CARRIAGE_RETURN = "\n"
    
    static let USER_FIELD_BLANK = "O campo 'user' está em branco\n"
    static let PASSWORD_FIELD_BLANK = "O campo 'password' está em branco\n"
    
}

// MARK: -
struct IDENTIFIERS {
    /// Constants for identifiers of some items of storyboard aka. table view cells, classes and segue.
    struct STORYBOARD {
        static let CURRENCY_VIEWCONTROLLER = "currency"
        static let NAME = "Main"
        static let SEGUE_NAME = "openCurrencyView"
        static let TABLE_VIEW_CELL = "StatementTableViewCell"
    }
    
    /// Constants for identifiers of storage data such as `UserDefaults`, `CoreData` etc
    struct STORAGE {
        static let LAST_USERNAME_LOGGED = "LastUsernameLogged"
    }
}

// MARK: -
/// Constants for general purposes.
struct CONSTANTS {
    static let BLANK = ""
    static let DASH = "-"
    static let CELL_SECTION_SIZE = 16
    static let NUM_ROWS_IN_SECTION = 1
    static let CELL_LAYER_BORDER_WIDTH = CGFloat(1)
    static let CELL_LAYER_CORNER_RADIUS = CGFloat(10)
    static let CELL_LAYER_SHADOW_RADIUS = CGFloat(10)
    static let CELL_LAYER_SHADOW_OPACITY = Float(0.2)
    static let CELL_BORDER_COLOR = CGColor(red: 240.0/255.0, green: 243.0/255.0, blue: 246.0/255.0, alpha: 1)
    static let CELL_LAYER_SHADOW_COLOR = UIColor.lightGray.cgColor
}
