@testable import BankApp
import XCTest

struct Seeds {
    struct UserInfo {
        static let user = User(user: "user", password: "pass")
        static let loggedAccount = UserAccount(userId: 1, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)
        static let loginFromFields = Login.LoginFromFields(login: "asdf", password: "asdf")
    }
}
