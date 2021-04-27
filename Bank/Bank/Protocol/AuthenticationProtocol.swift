import Foundation

public protocol AuthenticationProtocol {

    typealias ServiceReturnType = Result<User, MessageError>

    func auth(authentication: Authentication, completion: @escaping (ServiceReturnType) -> Void)
}
