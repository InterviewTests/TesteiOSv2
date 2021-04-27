import Foundation

public enum MessageError: Error, Equatable {
    case message(String)
    case unexpected
    case unauthorized
    case forbidden
    case badRequest
    case serverError
    case noConnectivity
    case emailInUse
    case expiredSession
}
