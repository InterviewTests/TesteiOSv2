import Foundation

protocol StatementProtocol {

    typealias ServiceReturnType = Result<[Statement], MessageError>

    func get(completion: @escaping (ServiceReturnType) -> Void)
}
