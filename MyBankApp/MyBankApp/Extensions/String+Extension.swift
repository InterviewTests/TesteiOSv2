import UIKit

extension String {
    func convertToValidDate() -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "ddMMyyyy"
        
        guard let date = inputFormatter.date(from: self) else {
            return nil // Unable to parse the input date string
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd/MM/yyyy"
        
        let formattedDate = outputFormatter.string(from: date)
        return formattedDate
    }
}
