import Foundation

enum Endpoint {
    
    case login
    case statement(id: String)
    
    func getEndpoint() -> String {
        
        switch self {
        case .login:
            return "login"
            
        case .statement(let id):
            return "statements/\(id)"
        }
    }
}
