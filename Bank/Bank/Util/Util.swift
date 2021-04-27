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
    
    static func isEmailValid(email: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func isCpfValid(cpf: String) -> Bool {
        
        let cpf = String().replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "-", with: "")
        
        if cpf.count == 11 {
            
            let i1 = cpf.index(cpf.startIndex, offsetBy: 9)
            let i2 = cpf.index(cpf.startIndex, offsetBy: 10)
            let i3 = cpf.index(cpf.startIndex, offsetBy: 11)
            let d1 = Int(cpf[i1..<i2])
            let d2 = Int(cpf[i2..<i3])
            
            var temp1 = 0, temp2 = 0
            
            for i in 0...8 {
                
                let start = cpf.index(cpf.startIndex, offsetBy: i)
                let end = cpf.index(cpf.startIndex, offsetBy: i+1)
                let char = Int(cpf[start..<end])
                
                temp1 += char! * (10 - i)
                temp2 += char! * (11 - i)
                
            }
            
            temp1 %= 11
            temp1 = temp1 < 2 ? 0 : 11-temp1
            
            temp2 += temp1 * 2
            temp2 %= 11
            temp2 = temp2 < 2 ? 0 : 11-temp2
            
            if temp1 == d1 && temp2 == d2 {
                
                return true
            }
        }
        
        return false
    }
}
