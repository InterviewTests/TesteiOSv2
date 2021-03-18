//
//  ShowStatementsPresenter.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import Foundation

protocol ShowStatementsPresentationLogic {
    func showUserInfo(response: ShowStatements.ShowStatements.Response)
}


class ShowStatementsPresenter: ShowStatementsPresentationLogic {
    var viewController: ShowStatementsLogic?
    
    func showUserInfo(response: ShowStatements.ShowStatements.Response) {
        if let userAccount = response.userAccount {
            let name = userAccount.name!
            let accountWithAgency = self.createAccountWithAgencyString(account: userAccount.bankAccount!,
                                                                       agency: userAccount.agency!)
            let balance = self.createBalanceString(balance: userAccount.balance!)
            let fields = ShowStatements.ShowStatementsFields(name: name,
                                                             accountWithAgency: accountWithAgency,
                                                             balance: balance)
            let viewModel = ShowStatements.ShowStatements.ViewModel(fields: fields)
            
            viewController?.displayUserAccountInfo(viewModel: viewModel)
        }
    }
    
    /// Mix a given account and a given agency strings, and applies the format xxxx / xx.xxxxxx-xx
    /// - Parameters:
    ///   - account: a `string` representing an account number
    ///   - agency: a `string` representing an agency number
    /// - Returns: a xxxx / xx.xxxxxx-xx format`string` with `account` and `agency`
    private func createAccountWithAgencyString(account: String, agency: String) -> String {
        let safeAccount = agency
        let safeAgency = account
        
        let accountPrefix = safeAccount.prefix(2)
        let accountMiddle = safeAccount.suffix(7).prefix(6)
        let accountDigit = safeAccount.suffix(1)
        
        return "\(safeAgency) / \(accountPrefix).\(accountMiddle)-\(accountDigit)"
    }
    
        
    /// Converts a double currency value to a brazilian currency format string (including brazilian sign R$)
    /// - Parameter balance: a `double` value (with dots separating decimail values) representing an amount
    /// - Returns: a `string` value containing the brazilian sign R$ plus the amount with comma separating decimal values
    private func createBalanceString(balance: Double) -> String {
        let number = NumberFormatter()
        number.numberStyle = .currency
        number.usesGroupingSeparator = true
        number.locale = Locale(identifier: "pt_BR")
        
        let numberNS = NSNumber(value: balance)
        let balanceString = number.string(from: numberNS)!.replacingOccurrences(of: " ", with: "")
        
        return balanceString
    }    
}
