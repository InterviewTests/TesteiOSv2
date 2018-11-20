//
//  Validator+String.swift
//  cs-ios
//
//  Created by Felipe perius on 21/02/17.
//  Copyright © 2017 Altran-AIS. All rights reserved.
//

import Foundation

extension String {

    public var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }

    public var isAlphanumericNotEspecial: Bool {
        return !isEmpty && range(of: "[a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    public var isCapitalLetter:Bool {
          return !isEmpty && range(of: "[A-Z]", options: .regularExpression) == nil
    }

	public var dontHaveSpecialCharacter: Bool {
		return !isEmpty && range(of: "[!@#$%&*()_+=0987654321/?´~;{}*ºª§\\|,®†¥©¬√≈<>≤≥…™£¢∞§¶•≠:«÷€‹›‡°·±₱„★‚¡¿`♪Π∞×§←↑↓→‰℅½⅓¼⅛⅔⅜¾⁴⅝⅞∅ⁿ“”»✓π∆¹²³※¤⁇⁈（）［］｛｝❨❩❲❳❴❵❛❜❝❞〈〉《》〔〕【】〘〙「」『』︵︶︷︸︹︹︻︼︽︾︿﹀﹁﹂↚↛↜↝↞↟↠↡↢↣↤↥↦↧↨↫↬↭↮↯↰↱↲↳↴↵↶↷↸↹↺↻↼↽↾↿⇀⇁⇂⇃⇄⇅⇆⇇⇈⇉⇊⇋⇌⇍⇎⇏⇐⇑⇒⇓⇔⇕⇖⇗⇘⇙⇚⇛⇜⇝⇞⇟⇠⇡⇢⇣≡≦≮≧≯⊕⊗∀∂∃∀∇∈∉∋∌∝∟∠∧∨∥∩∪∫∬∮∴∵∶∷⊂⊃⊄⊅⊆⊇∪∩ΓΞ①②③④⑤⑥⑦⑧⑨⑩⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽ⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩⅪⅫ●○■□☆◆◇▲△▷▼▽◁◐◑♀♂♤♡♧♢❖✓✕✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✩✪✫✬✭✮✯✰✱✲✵✶✷✸✹✺✻✼✽✾✿❀❁❂❃❅❆❈❉❊❋❍❏❐❑❒◈◉◊○◢◣◤◥❢❣❥❦❧§^\\[\\]\"]", options: .regularExpression) == nil
	}
    
    var isValidCPF: Bool {
        
        let numbers = self.compactMap({Int(String($0))})
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        let sum1 = 11 - ( numbers[0] * 10 +
            numbers[1] * 9 +
            numbers[2] * 8 +
            numbers[3] * 7 +
            numbers[4] * 6 +
            numbers[5] * 5 +
            numbers[6] * 4 +
            numbers[7] * 3 +
            numbers[8] * 2 ) % 11
        let dv1 = sum1 > 9 ? 0 : sum1
        let sum2 = 11 - ( numbers[0] * 11 +
            numbers[1] * 10 +
            numbers[2] * 9 +
            numbers[3] * 8 +
            numbers[4] * 7 +
            numbers[5] * 6 +
            numbers[6] * 5 +
            numbers[7] * 4 +
            numbers[8] * 3 +
            numbers[9] * 2 ) % 11
        let dv2 = sum2 > 9 ? 0 : sum2
        return dv1 == numbers[9] && dv2 == numbers[10]
    }
    
    var isValidEmail: Bool {
        
        let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_'{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isPasswordValid() ->Bool{
        let pass = self
        
        if pass.dontHaveSpecialCharacter && pass.isCapitalLetter && pass.isAlphanumericNotEspecial {
            return true
        } else {
            return false
        }
    }
    
    
}
