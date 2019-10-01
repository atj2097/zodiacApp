//
//  ZodiacDateViewController.swift
//  zodiacApp
//
//  Created by God on 9/27/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class ZodiacDateViewController: UIViewController  {
    var userZodiacFirst: Zodiac! {
        didSet {
            viewWillAppear(true)
        }
    }

    
    @IBOutlet weak var zodiacDate: UIDatePicker!
    
    @IBAction func zodiacFunc(_ sender: UIButton) {
        assignZodiac()
        loadData(sunSign: astro_sign)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatDate()
        loadDefaultSettings()
//        if UserDefaultsWrapper.manager.getZodiac() == nil {
//
//        }
    }
    private func convertMonth(monthNumber: Int) -> String {
        
        switch month {
        case 1:
            monthString = "january"
        case 2:
            monthString = "february"
        case 3:
            monthString = "march"
        case 4:
            monthString = "april"
        case 5:
            monthString = "may"
        case 6:
            monthString = "june"
        case 7:
            monthString = "july"
        case 8:
            monthString = "august"
        case 9:
            monthString = "september"
        case 10:
            monthString = "october"
        case 11:
            monthString = "november"
        case 12:
            monthString = "december"
        default:
            monthString = "nothing"
        }
        return monthString
    }
    private func loadDefaultSettings() {
        if let sunsign = UserDefaultsWrapper.manager.getZodiac() {
            astro_sign = sunsign
        }
        if let mon = UserDefaultsWrapper.manager.getMonth() {
            monthString = mon
        }
        if let day1 = UserDefaultsWrapper.manager.getDay() {
            day = day1
        }
    }
    
func assignZodiac() -> String {
        month = zodiacDate.calendar.component(.month, from: zodiacDate.date)
        print(month)
        day = zodiacDate.calendar.component(.day, from: zodiacDate.date)
    UserDefaultsWrapper.manager.store(day: day)
        print(day)
        //Converts Month To String
        convertMonth(monthNumber: month)
    UserDefaultsWrapper.manager.store(month: monthString)
        print(monthString)
        //Takes in Month And Day, Returns Astro Sign
        determineZodiac(month: monthString, day: day)
        print(astro_sign)
        return astro_sign
    }
    
}
