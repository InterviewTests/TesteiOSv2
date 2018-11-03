//
//  ToolBox.swift
//  bankibm
//
//  Created by Alexandre Furquim on 02/11/18.
//  Copyright © 2018 Alexandre Furquim. All rights reserved.
//

import UIKit
//MARK: - • EXTENSIONS

extension UIViewController{
    func loadingAlert() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
}

extension String {
    
    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
        let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[idx1..<idx2])
    }
    
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
    
    func isAlphanumeric() -> Bool {
        return self.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && self != ""
    }
    
    func isAlphanumeric(ignoreDiacritics: Bool = false) -> Bool {
        if ignoreDiacritics {
            return self.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil && self != ""
        }
        else {
            return self.isAlphanumeric()
        }
    }
    
    func hasSpecialCharacters() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, self.count)) {
                return true
            }
        } catch {
            debugPrint(error.localizedDescription)
            return false
        }
        return false
    }
    
    var letterCount : Int {
        return self.unicodeScalars.filter({ CharacterSet.letters.contains($0) }).count
    }
    
    var digitCount : Int {
        return self.unicodeScalars.filter({ CharacterSet.decimalDigits.contains($0) }).count
    }
    
}

final class ToolBox: NSObject{
    
    //MARK: - • DEFINES (STATIC PROPERTIES)
    
    public static let DATE_BAR_ddMMM:String = "dd/MMM"
    public static let DATE_BAR_ddMMMyyyy:String = "dd/MMM/yyyy"
    public static let DATE_BAR_ddMMyyyy:String = "dd/MM/yyyy"
    public static let DATE_BAR_yyyyMMdd:String = "yyyy/MM/dd"
    public static let DATE_BAR_ddMMyyyy_HHmm:String = "dd/MM/yyyy HH:mm"
    public static let DATE_BAR_yyyyMMdd_HHmm:String = "yyyy/MM/dd HH:mm"
    public static let DATE_BAR_yyyyMMdd_HHmmss_Z:String = "yyyy/MM/dd HH:mm:ss Z"
    public static let DATE_BAR_ddMMyyyy_HHmmss_Z:String = "dd/MM/yyyy HH:mm:ss Z"
    public static let DATE_BAR_ddMMyyyy_at_HHmm:String = "dd/MM/yyyy 'às' HH:mm"
    public static let DATE_BAR_yyyyMMdd_T_HHmmssSSSZ:String = "yyyy/MM/dd'T'HH:mm:ss.SSSZ"
    //
    public static let DATE_HIFEN_ddMMM:String = "dd-MMM"
    public static let DATE_HIFEN_ddMMMyyyy:String = "dd-MMM-yyyy"
    public static let DATE_HIFEN_ddMMyyyy:String = "dd-MM-yyyy"
    public static let DATE_HIFEN_yyyyMMdd:String = "yyyy-MM-dd"
    public static let DATE_HIFEN_ddMMyyyy_HHmm:String = "dd-MM-yyyy HH:mm"
    public static let DATE_HIFEN_yyyyMMdd_HHmm:String = "yyyy-MM-dd HH:mm"
    public static let DATE_HIFEN_yyyyMMdd_HHmmss_Z:String = "yyyy-MM-dd HH:mm:ss Z"
    public static let DATE_HIFEN_ddMMyyyy_HHmmss_Z:String = "dd-MM-yyyy HH:mm:ss Z"
    public static let DATE_HIFEN_ddMMyyyy_at_HHmm:String = "dd-MM-yyyy 'às' HH:mm"
    public static let DATE_HIFEN_yyyyMMdd_T_HHmmssSSSZ:String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    //
    public static let DATE_DOT_ddMMM:String = "dd.MMM"
    public static let DATE_DOT_ddMMMyyyy:String = "dd.MMM.yyyy"
    public static let DATE_DOT_ddMMyyyy:String = "dd.MM.yyyy"
    public static let DATE_DOT_yyyyMMdd:String = "yyyy.MM.dd"
    public static let DATE_DOT_ddMMyyyy_HHmm:String = "dd.MM.yyyy HH:mm"
    public static let DATE_DOT_yyyyMMdd_HHmm:String = "yyyy.MM.dd HH:mm"
    public static let DATE_DOT_yyyyMMdd_HHmmss_Z:String = "yyyy.MM.dd HH:mm:ss Z"
    public static let DATE_DOT_ddMMyyyy_HHmmss_Z:String = "dd.MM.yyyy HH:mm:ss Z"
    public static let DATE_DOT_ddMMyyyy_at_HHmm:String = "dd.MM.yyyy 'às' HH:mm"
    public static let DATE_DOT_yyyyMMdd_T_HHmmssSSSZ:String = "yyyy.MM.dd'T'HH:mm:ss.SSSZ"
    //
    public static let DATE_NONE_yyyyMMddHHmmss:String = "yyyyMMddHHmmss"
    public static let DATE_TIME_HHmm:String = "HH:mm"
    public static let DATE_TIME_HHmmss:String = "HH:mm:ss"
    //
    public static let CDATA_START:String = "<![CDATA["
    public static let CDATA_END:String = "]]>"
    //
    public static let SYMBOL_MONETARY:String = "R$"
    public static let SYMBOL_VOLUME_LIQUID:String = "L"
    public static let SYMBOL_VOLUME_SOLID:String = "m³"
    public static let SYMBOL_DISTANCE:String = "KM"
    //
    public static let TEXT_MASK_DEFAULT_WILD_SYMBOL:String = "#"
    public static let TEXT_MASK_DEFAULT_CHARS_SET:String = "()/.:-_|+ "
    public static let TEXT_MASK_CEP:String = "#####-###"
    public static let TEXT_MASK_PHONE:String = "(##) ####-####"
    public static let TEXT_MASK_CELLPHONE:String = "(##) #####-####"
    public static let TEXT_MASK_GENERIC_PHONE:String = "(##) #########"
    public static let TEXT_MASK_CPF:String = "###.###.###-##"
    public static let TEXT_MASK_CNPJ:String = "##.###.###/####-##"
    public static let TEXT_MASK_BIRTHDATE:String = "##/##/####"
    public static let TEXT_MASK_HOUR:String = "##:##"
    public static let TEXT_MASK_CREDIT_CARD_NUMBER:String = "#### #### #### ####"
    
    class var Date:ToolBoxDate.Type{
        return ToolBoxDate.self
    }
    
    class var Validation:ToolBoxValidation.Type{
        return ToolBoxValidation.self
    }
    
    class var Graphic:ToolBoxGraphic.Type{
        return ToolBoxGraphic.self
    }
    
    class var Converter:ToolBoxConverter.Type{
        return ToolBoxConverter.self
    }
    
    
    //MARK: - • DATE HELPER =======================================================================
    final class ToolBoxDate{
        
        /** Converte texto para data. Utilizar constantes definidas na classe 'ToolBox'.*/
        class func dateFromString(dateString:String?, stringFormat:String!) -> Date?{
            
            if let str = dateString {
                
                let updatedString:String = str.replacingOccurrences(of: " 0000", with: " +0000")
                
                let dateFormatter:DateFormatter = DateFormatter.init()
                let calendar:Calendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
                let enUSPOSIXLocale:Locale = Locale.init(identifier: "en_US_POSIX")
                //
                dateFormatter.timeZone = TimeZone.current
                dateFormatter.calendar = calendar
                dateFormatter.dateFormat = stringFormat
                dateFormatter.locale = enUSPOSIXLocale
                //
                let date:Date? = dateFormatter.date(from: updatedString)
                //
                return date
                
            }else{
                return nil
            }
        }
        
        
        /** Converte data para texto. Utilizar constantes definidas na classe 'ToolBox'.*/
        class func stringFromDate(date:Date?, stringFormat:String!) -> String{
            
            if let d = date {
                
                let dateFormatter:DateFormatter = DateFormatter.init()
                let calendar:Calendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
                let enUSPOSIXLocale:Locale = Locale.init(identifier: "en_US_POSIX")
                //
                dateFormatter.timeZone = TimeZone.current
                dateFormatter.calendar = calendar
                dateFormatter.dateFormat = stringFormat
                dateFormatter.locale = enUSPOSIXLocale
                //
                let strDate:String = dateFormatter.string(from: d)
                //
                return strDate
            }else{
                return ""
            }
        }
        
        /** Converte data para texto, considerando um TimeZone específico. Utilizar constantes definidas na classe 'ToolBox'.*/
        class func stringFromDate(date:Date?, stringFormat:String!, timeZone:TimeZone?) -> String{
            
            if let d = date {
                
                let dateFormatter:DateFormatter = DateFormatter.init()
                let calendar:Calendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
                let enUSPOSIXLocale:Locale = Locale.init(identifier: "en_US_POSIX")
                //
                if let tZ = timeZone {
                    dateFormatter.timeZone = tZ
                }else{
                    dateFormatter.timeZone = TimeZone.current
                }
                //
                dateFormatter.timeZone = TimeZone.current
                dateFormatter.calendar = calendar
                dateFormatter.dateFormat = stringFormat
                dateFormatter.locale = enUSPOSIXLocale
                //
                let strDate:String = dateFormatter.string(from: d)
                //
                return strDate
            }else{
                return ""
            }
        }
        
        
        /** Simplifica uma data, removendo hora, minuto e segundos (time resetado para zero).*/
        class func simplifyDate(date:Date?) -> Date?{
            
            if let d:Date = date {
                
                let strDate:String = self.stringFromDate(date: d, stringFormat: ToolBox.DATE_BAR_ddMMyyyy)
                let newDate:Date? = self.dateFromString(dateString: strDate, stringFormat: ToolBox.DATE_BAR_ddMMyyyy)
                //
                return newDate
                
            }else{
                return nil
            }
        }
    }
    
    
    //MARK: - • VALIDATION HELPER =======================================================================
    final class ToolBoxValidation{
        
        /** Verifica se um email é compatível segundo o regex utilizado por padrão. Para saber mais: 'http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/'.*/
        class func emailChecker(email:String!) -> ToolBoxValidationResult{
            
            // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
            //let stricterFilter:Bool = true
            
            let stricterFilterString:String = "^[_a-zA-Z0-9-]+([.]{1}[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+([.]{1}[a-zA-Z0-9-]+)*([.]{1}[a-zA-Z]{2,6})"
            //let laxString:String = ".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*"
            let emailRegex:String = stricterFilterString //stricterFilter ? stricterFilterString : laxString
            //
            let emailTest:NSPredicate = NSPredicate.init(format: "SELF MATCHES %@", emailRegex)
            //
            if (emailTest.evaluate(with: email) == false){
                return ToolBoxValidationResult.Disapproved
            }else{
                return ToolBoxValidationResult.Approved
            }
        }
        
        /* validar se a senha tem pelo menos uma letra maiuscula */
        class func checkUperCaseLetter (letter:String!) -> ToolBoxValidationResult{
            
            let stricterFilterString:String = ".*[A-Z]+.*"
            let letterUperRegex:String = stricterFilterString //stricterFilter ? stricterFilterString : laxString
            //
            let letterTest:NSPredicate = NSPredicate.init(format: "SELF MATCHES %@", letterUperRegex)
            //
            if (letterTest.evaluate(with: letter) == false){
                return ToolBoxValidationResult.Disapproved
            }else{
                return ToolBoxValidationResult.Approved
            }
        }
        
        /* validar se a senha tem pelo menos uma caracter especial */
        class func checkSpecialLetter (letter:String!) -> ToolBoxValidationResult{
            
            let stricterFilterString:String = ".*[!&^%$#@()/_*+-]+.*"
            let letterUperRegex:String = stricterFilterString //stricterFilter ? stricterFilterString : laxString
            //
            let letterTest:NSPredicate = NSPredicate.init(format: "SELF MATCHES %@", letterUperRegex)
            //
            if (letterTest.evaluate(with: letter) == false){
                return ToolBoxValidationResult.Disapproved
            }else{
                return ToolBoxValidationResult.Approved
            }
        }
                
        /** Verifica se um CPF é válido.*/
        class func validate(CPF:String?) -> ToolBoxValidationResult{
            
            guard CPF != nil else {
                return ToolBoxValidationResult.Undefined
            }
            
            
            //VERIFICA SE CPF TEM 11 DIGITOS
            if (CPF!.count != 11 || CPF! == ""){
                
                return ToolBoxValidationResult.Disapproved
            }
            
            
            //VERIFICA SEQUENCIA DE CARACTERES INVÁLIDAS
            if (CPF! == "00000000000") { return ToolBoxValidationResult.Disapproved }
            if (CPF! == "11111111111") { return ToolBoxValidationResult.Disapproved }
            if (CPF! == "22222222222") { return ToolBoxValidationResult.Disapproved }
            if (CPF! == "33333333333") { return ToolBoxValidationResult.Disapproved }
            if (CPF! == "44444444444") { return ToolBoxValidationResult.Disapproved }
            if (CPF! == "55555555555") { return ToolBoxValidationResult.Disapproved }
            if (CPF! == "66666666666") { return ToolBoxValidationResult.Disapproved }
            if (CPF! == "77777777777") { return ToolBoxValidationResult.Disapproved }
            if (CPF! == "88888888888") { return ToolBoxValidationResult.Disapproved }
            if (CPF! == "99999999999") { return ToolBoxValidationResult.Disapproved }
            
            
            //VALIDA CPF PELO DIGITO VERIFICADOR
            
            let nsCPF:NSString = CPF! as NSString
            
            var soma:Int = 0
            var peso:Int = 0
            //
            let digit_10:Int = Int(nsCPF.substring(with: NSRange(location: 9, length: 1)))!
            let digit_11:Int = Int(nsCPF.substring(with: NSRange(location: 10, length: 1)))!
            //
            var digit_10_correct:Int = 0;
            var digit_11_correct:Int = 0;
            
            //Verificação 10 Digito
            peso = 10
            
            for i in 0...8 {
                
                let x:Int = Int(nsCPF.substring(with: NSRange(location: i, length: 1)))!
                soma = soma + ( x * peso );
                peso = peso - 1;
            }
            
            if (soma % 11 < 2){
                digit_10_correct = 0;
            }else{
                digit_10_correct = 11 - (soma % 11);
            }
            
            
            //Verifição 11 Digito
            soma = 0
            peso = 11
            
            for i in 0...9 {
                
                let y:Int = Int(nsCPF.substring(with: NSRange(location: i, length: 1)))!
                soma = soma + ( y * peso );
                peso = peso - 1;
            }
            
            if (soma % 11 < 2){
                digit_11_correct = 0;
            }else{
                digit_11_correct = 11 - (soma % 11);
            }
            
            
            //Retorno
            if (digit_10_correct == digit_10 && digit_11_correct == digit_11){
                return ToolBoxValidationResult.Approved;
            }else{
                return ToolBoxValidationResult.Disapproved;
            }
        }
        
        
    }
    
    //MARK: - • ENUMS
    
    enum ToolBoxComparationRule:Int {
        case Less = 1
        case Equal = 2
        case Greater = 3
        case LessOrEqual = 4
        case GreaterOrEqual = 5
    }
    
    
    enum ToolBoxValidationResult:Int {
        case Undefined = 0
        case Approved = 1
        case Disapproved = 2
    }
    
    enum ToolBoxGrayScaleEffect:Int {
        case Noir = 0
        case Mono = 1
        case Tonal = 2
    }
    
    enum FileType{
        case video
        case photo
    }
    
    //MARK: - • GRAPHIC HELPER =======================================================================
    class ToolBoxGraphic{
        
        /** Cria uma cor RGB através de um texto HEX.*/
        class func colorWithHexString(string:String) -> UIColor{
            
            let hex = string.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int = UInt32()
            Scanner(string: hex).scanHexInt32(&int)
            let a, r, g, b: UInt32
            switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
            }
            //
            return UIColor.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
        }
        
        
        /** Adiciona sombra a View parâmetro.*/
        class func applyShadow(view:UIView, color:UIColor, offSet:CGSize, radius:CGFloat, opacity:Float){
            
            view.layer.masksToBounds = false
            view.layer.shadowColor = color.cgColor
            view.layer.shadowOffset = offSet
            view.layer.shadowRadius = radius
            view.layer.shadowOpacity = opacity
            view.layer.shouldRasterize = true
            view.layer.rasterizationScale = UIScreen.main.scale
            
        }
        
        /** Remove sombra da View parâmetro.*/
        class func removeShadow(view:UIView){
            
            view.layer.shadowColor = UIColor.clear.cgColor
            view.layer.shadowOffset = CGSize.zero
            view.layer.shadowRadius = 0.0
            view.layer.shadowOpacity = 0.0
            
        }
        
    }
    
    //MARK: - • CONVERTER HELPER =======================================================================
    final class ToolBoxConverter{
        
        /** Formata um valor numérico para seu equivalente monetário. Utiliza a localidade padrão do sistema.*/
        class func monetaryStringForValue(value:Double) -> String?
        {
            let formatter = NumberFormatter()
            formatter.numberStyle = NumberFormatter.Style.currency
            return formatter.string(from: NSNumber.init(value: value))
        }
        
        /** Retorna o equivalente numérico para um dado texto (localizado pt-BR). Ex: "R$ 50,00", "2,3 L", "5 m³" etc.*/
        class func decimalValueFromText(text:String) -> Double
        {
            var tempVE = text
            tempVE = tempVE.replacingOccurrences(of: ".", with: "")
            tempVE = tempVE.replacingOccurrences(of: " ", with: "")
            tempVE = tempVE.replacingOccurrences(of: ",", with: ".")
            tempVE = tempVE.replacingOccurrences(of: ToolBox.SYMBOL_MONETARY, with: "")
            tempVE = tempVE.replacingOccurrences(of: ToolBox.SYMBOL_VOLUME_LIQUID, with: "")
            tempVE = tempVE.replacingOccurrences(of: ToolBox.SYMBOL_VOLUME_SOLID, with: "")
            tempVE = tempVE.replacingOccurrences(of: ToolBox.SYMBOL_DISTANCE, with: "")
            
            let value:Double? = Double.init(tempVE)
            
            return (value ?? 0.0)
        }
        
        /** Formata um valor para texto, aplicando opcionalmente o símbolo monetário (localizado pt-BR).*/
        class func stringFromValue(value:Double, monetaryFormat monetary:Bool, decimalPrecision precision:Int) -> String
        {
            var texto:String
            
            let v = NSNumber.init(value: value)
            let formatter = NumberFormatter()
            let locale = Locale(identifier: "pt-BR")
            
            formatter.locale = locale
            formatter.numberStyle = .decimal
            formatter.roundingMode = .halfDown
            formatter.decimalSeparator = ","
            formatter.groupingSeparator = "."
            formatter.maximumFractionDigits = precision
            formatter.minimumFractionDigits = precision
            formatter.minimumIntegerDigits = 1
            texto = formatter.string(from: v)!
            //
            if(monetary)
            {
                return String("\(ToolBox.SYMBOL_MONETARY) \(texto)")
            }
            else
            {
                return texto
            }
        }
    }
    
    
    fileprivate final class ToolBoxPrivateHelper{
        
        //MARK: - • PRIVATE FUNCTIONS =======================================================================
        
        class func colorComponentFrom(str:String, start:Int, length:Int) -> CGFloat{
            
            let string:NSString = str as NSString
            let substring:NSString = string.substring(with: NSRange.init(location: start, length: length)) as NSString
            let fullHex:NSString = length == 2 ? substring : NSString.init(format: "%@%@", [substring, substring])
            var hexComponent:UInt32 = 0
            //
            guard Scanner(string: fullHex as String).scanHexInt32(&hexComponent)
                else {
                    return 0
            }
            
            return CGFloat(hexComponent) / 255.0
        }
        
        class func validateDigits(cnpj:String) -> Bool{
            
            var sum:Int = 0
            var weight:Int = 0
            
            let validatorDigit13:Int = Int(String((cnpj[cnpj.index(cnpj.startIndex, offsetBy: 12)])))!
            let validatorDigit14:Int = Int(String((cnpj[cnpj.index(cnpj.startIndex, offsetBy: 13)])))!
            var validDigit13:Int = 0
            var validDigit14:Int = 0
            
            //Verificação 13 Digito
            
            weight = 2
            
            for i in stride(from: 11, to: -1, by: -1) {
                let actualInt:Int = Int(String((cnpj[cnpj.index(cnpj.startIndex, offsetBy: i)])))!
                sum = sum + (actualInt * weight)
                
                weight += 1
                
                if (weight == 10){
                    weight = 2
                }
            }
            
            if(sum % 11 == 0 || sum % 11 == 1){
                validDigit13 = 0
            }else{
                validDigit13 = 11 - sum % 11
            }
            
            //Verificação 14 Digito
            
            sum = 0
            weight = 2
            
            for i in stride(from: 12, to: -1, by: -1) {
                let actualInt:Int = Int(String((cnpj[cnpj.index(cnpj.startIndex, offsetBy: i)])))!
                sum = sum + (actualInt * weight)
                
                weight += 1
                
                if weight == 10{
                    weight = 2
                }
            }
            
            if(sum % 11 == 0 || sum % 11 == 1){
                validDigit14 = 0
            }else{
                validDigit14 = 11 - sum % 11
            }
            
            //Retorno
            if (validatorDigit13 == validDigit13 && validatorDigit14 == validDigit14){
                return true
            }else{
                return false
            }
        }
        
        class func onlyNumbers(string: String) -> String {
            let set = CharacterSet.decimalDigits.inverted
            let numbers = string.components(separatedBy: set)
            return numbers.joined(separator: "")
        }
        
        class func addCDATA(string:String) -> String{
            
            let newSTR:String = String.init(format: "%@%@%@", [ToolBox.CDATA_START, string, ToolBox.CDATA_END])
            
            return newSTR
        }
        
        class func removeCDATA(string:String) -> String{
            
            var newSTR = string
            
            if (string.hasPrefix(ToolBox.CDATA_START)){
                
                newSTR = newSTR.replacingOccurrences(of: ToolBox.CDATA_START, with: "")
                
            }
            
            if (string.hasSuffix(ToolBox.CDATA_END)){
                
                newSTR = newSTR.replacingOccurrences(of: ToolBox.CDATA_END, with: "")
            }
            
            return newSTR
        }
        
        class func comumsCNPJ(cnpj:String) -> Int{
            
            /*
             0 - Validado
             1 - Não possui 14 digitos
             2 - CNPJ não permitido: Sequencia de números
             */
            
            if (cnpj.count != 14 || cnpj == ""){
                return 1
            }else if (cnpj == "00000000000000"
                || cnpj == "11111111111111"
                || cnpj == "22222222222222"
                || cnpj == "33333333333333"
                || cnpj == "44444444444444"
                || cnpj == "55555555555555"
                || cnpj == "66666666666666"
                || cnpj == "77777777777777"
                || cnpj == "88888888888888"
                || cnpj == "99999999999999"){
                return 2
            }else{
                return 0
            }
        }
    }
}

