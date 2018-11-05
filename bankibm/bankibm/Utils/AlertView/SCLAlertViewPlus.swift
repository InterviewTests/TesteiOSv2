//
//  SCLAlertViewPlus.swift
//  bankibm
//
//  Created by Alexandre Furquim on 02/11/18.
//  Copyright © 2018 Alexandre Furquim. All rights reserved.
//

import SCLAlertView

//MARK: - Enums and Extensions

enum SCLAlertButtonType: Int {
    case Default         = 0
    case Neutral         = 1
    case Success         = 2
    case Error           = 3
    case Notice          = 4
    case Warning         = 5
    case Info            = 6
    case Edit            = 7
    case Wait            = 8
}

//MARK: - SCLAlertViewPlus
class SCLAlertViewPlus:SCLAlertView{

    required init() {

        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium),
            kTextFont: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular),
            kButtonFont: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium),
            showCloseButton: false
        )

        super.init(appearance: appearance)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //MARK: - Class Funcs

    class func createDefaultAlert() -> SCLAlertViewPlus{

        let alert:SCLAlertViewPlus = SCLAlertViewPlus.init()
        //
        return alert
    }

    //MARK: - Personalized Methods

    let appearance = SCLAlertView.SCLAppearance(
        showCircularIcon: false
    )

    func addButton(title:String, type:SCLAlertButtonType, action:@escaping () -> Void){

        var color:UIColor?

        switch type {
        case .Default:
            color = nil

        case .Neutral:
            color = UIColor.lightGray

        case .Success:
            color = self.UIColorFromRGB(0x22B573)

        case .Error:
            color = self.UIColorFromRGB(0xC1272D)

        case .Notice:
            color = self.UIColorFromRGB(0x727375)

        case .Warning:
            color = self.UIColorFromRGB(0xFFD110)

        case .Info:
            color = self.UIColorFromRGB(0x2866BF)

        case .Edit:
            color = self.UIColorFromRGB(0xA429FF)

        case .Wait:
            color = self.UIColorFromRGB(0xD62DA5)
        }

        super.addButton(title, backgroundColor: color, textColor: UIColor.white, showTimeout: nil) {
            action()
        }
    }

    //MARK: - Private Methods

    private func RGBFromUIColor(color:UIColor) -> UInt{

        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0

        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        var colorAsUInt32 : UInt32 = 0
        colorAsUInt32 += UInt32(red * 255.0) << 16
        colorAsUInt32 += UInt32(green * 255.0) << 8
        colorAsUInt32 += UInt32(blue * 255.0)

        let colorAsUInt = UInt(colorAsUInt32)

        return colorAsUInt
    }

    private func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
