import Foundation

struct ErrorResponse: Codable, Equatable {

    // MARK: - Properties

    let code: Int?
    let message: String?

    // MARK: - Inits

    init(code: Int? = nil, message: String? = nil) {
        self.code = code
        self.message = message
    }

    // MARK: - Equatable

    static func == (lhs: ErrorResponse, rhs: ErrorResponse) -> Bool {
        lhs.code == rhs.code && lhs.message == rhs.message
    }
}

enum BankFailure: Error, Equatable {

    // MARK: - Equatable

    static func == (lhs: BankFailure, rhs: BankFailure) -> Bool {
        switch (lhs, rhs) {
        case (.number, .number): return true
        case (.network(let lnet), .network(let rnet)):
            return lnet == rnet
        default:
            return false
        }
    }

    case number
    case network(ErrorResponse?)
}
