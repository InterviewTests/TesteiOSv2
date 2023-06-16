import Foundation

enum BankFailure : Error {
    case number
    case network(code: Int)
    case network(Error?)
}
