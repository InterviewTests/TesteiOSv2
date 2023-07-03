import Foundation

struct LoginResponse: Codable, Equatable {
    let userId: String
    let email: String
    let cpf: String
    let name: String
    let accountNumber: String
    let agency: String
    let balance: String
}
