import UIKit

struct User {
    let username: String
    let password: String
}

/// Worker Class for validation of entry fields (a.k.a. username and password)
class LoginFieldsValidationWorker {
    /// Validates if an `user` object has valid `username` and `password` parameters, based on:
    /// - `User.username` must be a CPF valid (with or without dots and slash) or an email valid; and
    /// - `User.password` must have at least 6 digits, one uppercased letter, one number and one special character.
    ///
    /// - Parameter user: an `User` object
    /// - Returns: `true` if both `username` and `password` are valid; otherwise, `false`.
    func validate(user: User) -> Bool {
        if isPasswordValid(password: user.password) {
            return isUsernameValid(username: user.username)
        }
        
        return false
    }
    
    /// Validates if a `password` is valid. Technically speaking, returns `true` if `password` contais at least six digits, one uppercased letter,
    /// one number and one special character; otherwise, it returns `false`
    ///
    /// - Parameter password: the `password` string.
    /// - Returns: `true` if `password` is valid; `false` if it is invalid.
    private func isPasswordValid(password: String) -> Bool {
        let passwordPattern =
            #"(?=.{6,})(?=.*[A-Z])(?=.*\d)(?=.*[ !$%&@?._-])"#
        
        let result = password.range(of: passwordPattern, options: .regularExpression)
        
        return result != nil
    }
    
    
    /// Validates if a `username` is valid. Technically speaking, returns `true` if `username` is:
    /// - a valid CPF;
    /// - a valid email.
    ///
    /// - Parameter username: the `username` string.
    /// - Returns: `true` if `username` is a CPF or email valid; `false` if it is invalid.
    private func isUsernameValid(username: String) -> Bool {
        return isEmailValid(email: username) || isCPFValid(cpf: username)
    }
            
    /// Verifies if an `email` matches the email pattern (a.k.a. ccc@ccc.ccc, with 'c' representing alphanumeric characters including dash, underscore and dot).
    /// - Parameter email: the `email` string.
    /// - Returns: `true` if `email` has an email pattern valid; `false` if it does not have a valid pattern
    private func isEmailValid(email: String) -> Bool {
        let emailPattern = #"^\S+@\S+\.\S+$"#
        let result = email.range(of: emailPattern, options: .regularExpression)
        return result != nil
    }
    
    
    /// Verifies if a `cpf` has a valid pattern cpf (a.k.a. if `cpf` has eleven numbers with the format nnn.nnn.nnn-nn or nnnnnnnnnnn),
    /// and matches the **Receita Federal**'s algorithm.
    /// - Parameter cpf: the `cpf` string
    /// - Returns: `true` if `cpf` is valid; `false` if `cpf` is invalid.
    private func isCPFValid(cpf: String) -> Bool {
        if hasCPFPatternValid(cpf: cpf) {
            let onlyNumbers = removeFormattingOf(cpf: cpf)
                                    
            if containsDifferentNumbers(cpf: onlyNumbers) {
                if matchesTheCPFAlgorithm(cpf: onlyNumbers) {
                    return true
                }
            }
        }
        
        return false
    }
    
    /// Verifies if `cpf` matches the CPF format (a.k.a. nnn.nnn.nnn-nn or nnnnnnnnnnn, given **n** as a number between 0 and 9 included)
    /// - Parameter cpf: the `cpf` string
    /// - Returns: `true` if the `cpf` matches the pattern; `false` if the `cpf` does not match.
    private func hasCPFPatternValid(cpf: String) -> Bool {
        let cpfPattern = #"[0-9]{3}\.?[0-9]{3}\.?[0-9]{3}\-?[0-9]{2}"#
        let result = cpf.range(of: cpfPattern, options: .regularExpression)
        return result != nil
    }
    
    /// Removes the formatting of `cpf` string, returning a string with only numbers.
    /// - Parameter cpf: the `cpf` string with formatting (e.g. "123.456.789-90")
    /// - Returns: a string made only with numbers (e.g. "12345678990")
    private func removeFormattingOf(cpf: String) -> String {
        let onlyNumbers = cpf.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        return onlyNumbers
    }
    
    /// Verifies if `cpf` contains sequence of equal numbers (e.g. "11111111111" or "99999999999").
    /// - Parameter cpf: A string containing eleven numbers.
    /// - Returns: `true` if the `cpf` string does contain distinct numbers; `false` if the `cpf` string contains a sequence of eleven equal numbers.
    private func containsDifferentNumbers(cpf: String) -> Bool {
        let set = NSCountedSet(array: Array(cpf))
        return set.count != 1
    }
    
    /// Verifies if the `cpf` string matches the **Receita Federal**'s algorithm ( (https://pt.wikipedia.org/wiki/Cadastro_de_pessoas_f%C3%ADsicas#Algoritmo)
    /// - Parameter cpf: a `cpf` string
    /// - Returns: `true` if the `cpf` matches the algorithm; `false` if the `cpf` does not match.
    private func matchesTheCPFAlgorithm(cpf: String) -> Bool {
        print(cpf)
        
        let indexOne = cpf.index(cpf.startIndex, offsetBy: 9)
        let indexTwo = cpf.index(cpf.startIndex, offsetBy: 10)
        let indexThree = cpf.index(cpf.startIndex, offsetBy: 11)
        
        let digitOne = Int(cpf[indexOne..<indexTwo])
        let digitTwo = Int(cpf[indexTwo..<indexThree])
        
        var temp1 = 0
        var temp2 = 0
        
        for index in 0...8 {
            let start = cpf.index(cpf.startIndex, offsetBy: index)
            let end = cpf.index(cpf.startIndex, offsetBy: index + 1)
            let char = Int(cpf[start..<end])
            
            temp1 += char! * (10 - index)
            temp2 += char! * (11 - index)
        }
        
        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11 - temp1
        
        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2
        
        return temp1 == digitOne && temp2 == digitTwo
    }
}
    
let paul = User(username: "355.356.418-04", password: "Test@1")
let angela = User(username: "111.111.111-11", password: "Test@1")
let ray = User(username: "123.456.789-00", password: "Test@3")

let validator = LoginFieldsValidationWorker()

print(validator.validate(user: paul))
print(validator.validate(user: angela))
print(validator.validate(user: ray))

