//
//  ZoExtension.swift
//  zodiacApp
//
//  Created by God on 9/28/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

extension ZodiacDateViewController {
    //ViewTransition
    func pushViewController() {
        let userZodiacDefault = userZodiacFirst
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "horoscopeController") as! ZodiacDVCViewController
        nextViewController.userZodiac = userZodiacDefault
       self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
 func loadData(sunSign: String) {
        ZodiacAPIManager.shared.getZodiac(astroSign: sunSign){ (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let zodiacFromOnline):
                    self.userZodiacFirst = zodiacFromOnline
                    self.pushViewController()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
   
    
    //FormatDate
    func formatDate() {
    let datePicker = zodiacDate
        datePicker!.datePickerMode = .date
    }

}
