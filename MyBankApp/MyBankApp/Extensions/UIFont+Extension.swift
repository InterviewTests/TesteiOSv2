import UIKit

extension UIFont {
    
    func set(_ fontName: MyBankFont, size: CGFloat) -> UIFont {
        return UIFont(name: fontName.rawValue, size: size) ?? UIFont(name: "Arial", size: size)!
    }
    
    enum MyBankFont: String {
        case HelveticaNeue      = "HelveticaNeue"
        case HelveticaNeueLight = "HelveticaNeue-Light"
    }
}
