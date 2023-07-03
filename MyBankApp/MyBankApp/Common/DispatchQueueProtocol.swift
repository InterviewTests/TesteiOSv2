import Foundation

protocol DispatchQueueProtocol {
    func async(execute work: @escaping () -> Void)
}

final class MainDispatchQueueWrapper: DispatchQueueProtocol {
    func async(execute work: @escaping () -> Void) {
        DispatchQueue.main.async(execute: work)
    }
}
