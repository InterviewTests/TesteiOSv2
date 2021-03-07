//
//  Extensions.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 01/03/21.
//

import UIKit

// MARK: - ViewController extension. Enable 'dismiss keyboard when user taps outside of UITextView' ("https://medium.com/@sruthicsankar/dismiss-hide-keyboard-by-touching-anywhere-outside-uitextfield-ios-swift-f0a719a91299")
extension UIViewController {
    func dismissKey() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - UserCurrencyViewController extension. Implement table view methods
extension UserCurrencyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CONSTANTS.NUM_ROWS_IN_SECTION
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIERS.STORYBOARD.TABLE_VIEW_CELL, for: indexPath) as? StatementTableViewCell {
            
            let currentStatement = self.statements[indexPath.section]
            
            cell.titleLabel.text = currentStatement.title
            cell.descriptionLabel.text = currentStatement.description
            cell.dateLabel.text = currentStatement.date
            cell.valueLabel.text = currentStatement.value
            cell.valueLabel.textColor = self.setLabelColorBasedOn(value: currentStatement.value)
                
            self.addEffectsTo(cell: cell)
            
            return cell
        }
                        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(CONSTANTS.CELL_SECTION_SIZE)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    
    /// Add some effects in a cell, e.g. `backgroundColor`, `borderColor` etc.
    /// - parameter cell: the cell in which the effects will be added
    private func addEffectsTo(cell: StatementTableViewCell) {
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = CONSTANTS.CELL_BORDER_COLOR
        cell.layer.borderWidth = CONSTANTS.CELL_LAYER_BORDER_WIDTH
        cell.layer.cornerRadius = CONSTANTS.CELL_LAYER_CORNER_RADIUS
        cell.clipsToBounds = false
                                
        cell.layer.shadowRadius = CONSTANTS.CELL_LAYER_SHADOW_RADIUS
        cell.layer.shadowOpacity = CONSTANTS.CELL_LAYER_SHADOW_OPACITY
        cell.layer.shadowColor = CONSTANTS.CELL_LAYER_SHADOW_COLOR
        cell.layer.shadowOffset = CGSize(width: 2, height: 2)
    }
    
    /// Add `red` color if a **dash** sign ("-") is found in the string (in other words, if the value is a debit)
    private func setLabelColorBasedOn(value: String) -> UIColor {
        if value.contains(CONSTANTS.DASH) {
            return UIColor.red
        }
        
        return UIColor.black
    }
}
