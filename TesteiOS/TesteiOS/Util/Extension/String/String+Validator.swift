//
//  String+Validator.swift
//  TesteiOS
//
//  Created by Fernando Gomes on 14/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation

extension String {
    private var hasSpecialCharacter: Bool {
        return !isEmpty && range(of: "[!@#$%&*()_+=0987654321/?´~;{}*ºª§\\|,®†¥©¬√≈<>≤≥…™£¢∞§¶•≠:«÷€‹›‡°·±₱„★‚¡¿`♪Π∞×§←↑↓→‰℅½⅓¼⅛⅔⅜¾⁴⅝⅞∅ⁿ“”»✓π∆¹²³※¤⁇⁈（）［］｛｝❨❩❲❳❴❵❛❜❝❞〈〉《》〔〕【】〘〙「」『』︵︶︷︸︹︹︻︼︽︾︿﹀﹁﹂↚↛↜↝↞↟↠↡↢↣↤↥↦↧↨↫↬↭↮↯↰↱↲↳↴↵↶↷↸↹↺↻↼↽↾↿⇀⇁⇂⇃⇄⇅⇆⇇⇈⇉⇊⇋⇌⇍⇎⇏⇐⇑⇒⇓⇔⇕⇖⇗⇘⇙⇚⇛⇜⇝⇞⇟⇠⇡⇢⇣≡≦≮≧≯⊕⊗∀∂∃∀∇∈∉∋∌∝∟∠∧∨∥∩∪∫∬∮∴∵∶∷⊂⊃⊄⊅⊆⊇∪∩ΓΞ①②③④⑤⑥⑦⑧⑨⑩⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽ⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩⅪⅫ●○■□☆◆◇▲△▷▼▽◁◐◑♀♂♤♡♧♢❖✓✕✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✩✪✫✬✭✮✯✰✱✲✵✶✷✸✹✺✻✼✽✾✿❀❁❂❃❅❆❈❉❊❋❍❏❐❑❒◈◉◊○◢◣◤◥❢❣❥❦❧§^\\[\\]\"]", options: .regularExpression) == nil

    }
    
    private var hasAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    private var hasCapittalLetter: Bool {
        return !isEmpty && range(of: "[A-Z]", options: .regularExpression) == nil
    }
    
    public var isValidPassword: Bool {
        return hasSpecialCharacter && hasAlphanumeric && hasCapittalLetter
    }
    
    private var onlyCpfNumber:String {
        guard !isEmpty else { return "" }
        return replacingOccurrences(of: "\\D",
                                    with: "",
                                    options: .regularExpression,
                                    range: startIndex..<endIndex)
    }
    
    public var isValidCpf: Bool {
        let cpf = self.onlyCpfNumber
        guard cpf.count == 11 else { return false }
        
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
        
        return temp1 == d1 && temp2 == d2
    }
    
    public var isValidEmail: Bool {
        return !isEmpty && range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .regularExpression) == nil
    }
}
