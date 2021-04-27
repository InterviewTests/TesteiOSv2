import Foundation

class Util {
    
    static func doubleToCurrency(value: Double) -> String {
        
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: value as NSNumber) {
            return String(format: formattedTipAmount)
        } else {
            return ""
        }
    }
}
