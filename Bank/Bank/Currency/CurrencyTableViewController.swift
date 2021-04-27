import UIKit

extension CurrencyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.reuseIdentifier, for: indexPath) as? CurrencyTableViewCell else {
            return UITableViewCell()
        }
        
        let statement = statements[indexPath.row]
        
        cell.title = statement.title
        cell.date = statement.dateFormat()
        cell.desc = statement.description
        cell.value = statement.valueFormat()
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 160.0
    }
}

extension CurrencyViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NSLocalizedString("currency_header_tableview", comment: "")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        view.tintColor = .white

        let header: UITableViewHeaderFooterView? = (view as? UITableViewHeaderFooterView)
        header?.textLabel?.textColor = .black
        header?.textLabel?.font = UIFont(name: "HelveticaNeue", size: 17)
    }
}
