import Foundation

struct LoginResponse: Decodable {
    let userId: String
    let email: String
    let cpf: String
    let name: String
    let accountNumber: String
    let agency: String
    let balance: String
}
