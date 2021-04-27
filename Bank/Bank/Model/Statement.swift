import Foundation

struct Statement: Model {

    internal init(title: String, date: Date, description: String, value: Double) {
        self.title = title
        self.date = date
        self.description = description
        self.value = value
    }

    let title: String
    let date: Date
    let description: String
    let value: Double

    func dateFormat() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = NSLocalizedString("currency_cell_date_format", comment: "")
        return dateFormatter.string(from: date)
    }
    
    func valueFormat() -> String {
        
        return Util.doubleToCurrency(value: value)
    }
}
