import Foundation

public struct User: Model {
    
    public init(userId: String, name: String, bankAccount: String, agency: String, balance: Double) {
        self.userId = userId
        self.name = name
        self.bankAccount = bankAccount
        self.agency = agency
        self.balance = balance
    }
    
    let userId: String
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
    
    public var id: String {
        get {
            userId
        }
    }
    
    func balanceFormat() -> String {
        
        return Util.doubleToCurrency(value: balance)
    }
    
    func accountFormat() -> String {
        
        return "\(agency) / \(bankAccount)"
    }
}
