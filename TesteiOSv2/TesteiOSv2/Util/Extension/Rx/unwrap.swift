//
//  unwrap.swift
//  toroguru
//
//  Created by Andre Rodrigues on 05/05/18.
//  Copyright © 2018 br.com.toroguru. All rights reserved.
//

import RxSwift

extension ObservableType {
    
    func unwrap<T>() -> Observable<T> where E == T? {
        return self.filter { $0 != nil }.map { $0! }
    }
}
