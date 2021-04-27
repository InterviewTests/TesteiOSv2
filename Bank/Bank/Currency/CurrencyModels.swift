import UIKit

enum Currency {
    // MARK: Use cases
    
    enum StatementModel {
        struct Request {
            let userID: String
        }
        struct Response {
            let statements: [Statement]
        }
        struct ViewModel {
            let statements: [Statement]
        }
    }
}
