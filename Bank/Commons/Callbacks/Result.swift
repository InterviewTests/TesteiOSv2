//
//  Result.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import Foundation

enum Result<E> where E:Error {
    case success(data: Data)
    case failed(E)
}
