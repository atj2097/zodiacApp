//
//  UserModel.swift
//  zodiacApp
//
//  Created by God on 9/24/19.
//  Copyright © 2019 God. All rights reserved.
//

import Foundation

class UserDefaultsWrapper {
    
    // MARK: - Static Properties
    
    static let manager = UserDefaultsWrapper()
    
    // MARK: - Internal Methods
    
    func store(day: Int) {
        UserDefaults.standard.set(day, forKey: dayKey)
    }
    
    func store(month: String) {
        UserDefaults.standard.set(month, forKey: monthKey)
    }
    func zodiacStore(zodiac: String) {
        UserDefaults.standard.set(zodiac, forKey: zodiacKey)
    }
    func getZodiac() -> String? {
        return UserDefaults.standard.value(forKey: zodiacKey) as? String
    }
    func getMonth() -> String? {
        return UserDefaults.standard.value(forKey: monthKey) as? String
    }
    func getDay() -> Int? {
        return UserDefaults.standard.value(forKey: dayKey) as? Int
    }
    
    

    
    // MARK: - Private inits and properties
    
    private init() {}
    
    private let monthKey = "month"
    private let zodiacKey = "zodiac"
    private let dayKey = "dayKey"
}
