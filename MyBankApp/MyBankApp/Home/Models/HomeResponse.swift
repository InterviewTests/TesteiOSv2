import Foundation

struct HomeResponse: Decodable {
    let statement: [Statement]
}

struct Statement: Decodable, Equatable {
    let id: Int
    let type: String
    let date: String
    let detail: String
    let value: Double
}
