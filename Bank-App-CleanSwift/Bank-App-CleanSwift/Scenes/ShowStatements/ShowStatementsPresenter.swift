//
//  ShowStatementsPresenter.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import Foundation

protocol ShowStatementsPresentationLogic {
    func showUserInfo(response: ShowStatements.UserAccountDescription.Response)
    func showStatements(response: ShowStatements.ShowStatements.Response)
}


class ShowStatementsPresenter: ShowStatementsPresentationLogic {
    var viewController: ShowStatementsLogic?
        
    /// Formats `response` contents properly
    /// - Parameter response: a `response` object
    func showUserInfo(response: ShowStatements.UserAccountDescription.Response) {
        if let userAccount = response.userAccount {
            let name = userAccount.name!
            let accountWithAgency = self.createAccountWithAgencyString(account: userAccount.bankAccount!,
                                                                       agency: userAccount.agency!)
            let balance = self.createBalanceString(balance: userAccount.balance!)
            let fields = ShowStatements.UserAccountDescriptionFields(name: name,
                                                             accountWithAgency: accountWithAgency,
                                                             balance: balance)
            let viewModel = ShowStatements.UserAccountDescription.ViewModel(fields: fields)
            
            viewController?.displayUserAccountInfo(viewModel: viewModel)
        }
    }
        
    
    /// Mixes a given account and a given agency strings, and applies the format xxxx / xx.xxxxxx-xx
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
    
    
    /// Prepares the `response` contents to be showed in view controller
    /// - Parameter response: a `response` object
    func showStatements(response: ShowStatements.ShowStatements.Response) {
        var statements: [Statement] = []
        
        for statementData in response.statementDataArray {
            let statement = self.createStatement(from: statementData)
            
            statements.append(statement) 
        }
                
        let viewModel = ShowStatements.ShowStatements.ViewModel(statements: statements)
        viewController?.populateTableView(viewModel: viewModel)
    }
    
    
    /// Creates a `Statement` object based on a `StatementData`
    /// - Parameter statementData: the `statementData` object
    /// - Returns: a `Statement` object
    private func createStatement(from statementData: StatementListData.StatementData) -> Statement {
        let title = statementData.title
        let description = statementData.description
        let date = self.formatDate(statementData.date)
        let totalAmount = self.formatAmount(statementData.totalAmount)
        
        return Statement(title: title, description: description, date: date, totalAmount: totalAmount)
    }
    
    
    /// Formats a date from pattern `yyyy-MM-dd` to `dd/MM/yyyy`
    /// - Parameter oldDate: the date `String` in US pattern
    /// - Returns: a date `String` in BR pattern
    private func formatDate(_ oldDate: String) -> String {
        return oldDate
    }
    
    
    /// Transforms a `double` value representing an amount in a BR currency formatting value. If `oldAmount` is `3.23`, then the method
    /// returns `"R$ 3,23"`
    /// - Parameter oldAmount: a `double` value representing an currency amount
    /// - Returns: a BR-formatted `string` representation of this value
    private func formatAmount(_ oldAmount: Double) -> String {
        return "\(oldAmount)"
    }
}
