import XCTest
@testable import MyBankApp

typealias DispatchQueueDummy = DispatchQueueSpy
class DispatchQueueSpy: DispatchQueueProtocol {
    func async(execute work: @escaping () -> Void) {
        work()
    }
}
