import UIKit

extension String {
    var containsUppercaseLetter: Bool {
        let uppercaseLetterRegex = ".*[A-Z]+.*"
        let uppercaseLetterPredicate = NSPredicate(format: "SELF MATCHES %@", uppercaseLetterRegex)
        return uppercaseLetterPredicate.evaluate(with: self)
    }
    
    var containsSpecialCharacter: Bool {
        let specialCharacterRegex = ".*[^A-Za-z0-9].*"
        let specialCharacterPredicate = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegex)
        return specialCharacterPredicate.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
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
    
    func isValidCPF() -> Bool {
        let numbers = self.compactMap({Int(String($0))})
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        let soma1 = 11 - ( numbers[0] * 10 +
                           numbers[1] * 9 +
                           numbers[2] * 8 +
                           numbers[3] * 7 +
                           numbers[4] * 6 +
                           numbers[5] * 5 +
                           numbers[6] * 4 +
                           numbers[7] * 3 +
                           numbers[8] * 2 ) % 11
        let dv1 = soma1 > 9 ? 0 : soma1
        let soma2 = 11 - ( numbers[0] * 11 +
                           numbers[1] * 10 +
                           numbers[2] * 9 +
                           numbers[3] * 8 +
                           numbers[4] * 7 +
                           numbers[5] * 6 +
                           numbers[6] * 5 +
                           numbers[7] * 4 +
                           numbers[8] * 3 +
                           numbers[9] * 2 ) % 11
        let dv2 = soma2 > 9 ? 0 : soma2
        return dv1 == numbers[9] && dv2 == numbers[10]
    }
}
