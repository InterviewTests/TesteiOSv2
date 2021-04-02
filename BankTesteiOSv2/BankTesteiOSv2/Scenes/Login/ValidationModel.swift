//
//  protocolValidationModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 01/04/21.
//

import Foundation
import RxRelay

protocol ValidationModel
{
    var errorMessage: String { get }
    
    var data: BehaviorRelay<String> { get set }
    var errorValue: BehaviorRelay<String?> { get}
    
    func validateData() -> Bool
}
