import Foundation
import Bank

func makeLoginResponse() -> User {
    return User(userId: "123", name: "José da Silva", bankAccount: "01.144552-4", agency: "8585", balance: 1500)
}

func makeAuthentication() -> Authentication {
    return Authentication(user: "jose@gmail.com", password: "123456")
}
