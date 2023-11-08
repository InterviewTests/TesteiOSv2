import Foundation

struct LoginRequest: Equatable, Codable {
    let username: String
    let password: String
}
