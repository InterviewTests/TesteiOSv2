//
//  Util.swift
//  TesteiOSSantander
//
//  Created by julio.c.tanchiva on 12/19/18.
//  Copyright © 2018 julio.c.tanchiva. All rights reserved.
//

import UIKit

class Util{
    
    static let getFunctions = Util()

    func verifyPassword(Password: String)-> Bool{
        if letraMaiuscula(Password: Password) && caracterEspecial(Password: Password) && alfaNumerico(Password: Password){
            return true
        }
        return false
    }
    
    func letraMaiuscula(Password: String)-> Bool{
       
        return true
    }
    func caracterEspecial(Password: String)-> Bool{
        let character = ["!","@","#","$","%","&","*"]
        let srtCharacterArray = Password.map{ String($0)}
        for str in character{
            for strI  in srtCharacterArray{
                if str == strI{
                    return true
                }
            }
           
        }
        return false
    }
    func alfaNumerico(Password: String)->Bool{
        let number = ["1","2","3","4","5","6","7","8","9","0"]
        let srtCharacterArray = Password.map{ String($0)}
        for str in number{
            for strI  in srtCharacterArray{
                if str == strI{
                    return true
                }
            }
            
        }
        return false
    }
 
}
