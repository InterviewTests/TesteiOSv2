//
// UserPreferencesWorker.swift
//  Bank Watch App Extension
//
//  Created by Chrystian Salgado on 08/03/19.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import Foundation

class UserPreferencesWorker {
    
    func savePreference(value: Any, usingKey: String) {
        UserDefaults.standard.set(value, forKey: usingKey)
    }
    
    func getPreference(from key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    
    func deletePreference(from key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
