//
//  PublicVar.swift
//  zodiacApp
//
//  Created by God on 9/28/19.
//  Copyright © 2019 God. All rights reserved.
//

import Foundation
//All Global Variables
public var monthString = "" {
    didSet {
        UserDefaultsWrapper.manager.store(month: monthString)
    }
}
public var month = Int()
public var day = Int() {
    didSet {
        UserDefaultsWrapper.manager.store(day: day)
    }
}
public var astro_sign: String = "" {
    didSet {
        UserDefaultsWrapper.manager.zodiacStore(zodiac: astro_sign)
    }
}
