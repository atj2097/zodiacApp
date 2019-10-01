//
//  ZodiacDVCViewController.swift
//  zodiacApp
//
//  Created by God on 9/27/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class ZodiacDVCViewController: UIViewController {
    var userZodiac: Zodiac!
    @IBOutlet weak var zodiacSign: UILabel!
    
    @IBOutlet weak var zodiacHoroscope: UITextView!
    
    @IBOutlet weak var todaysDate: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
  
        // Do any additional setup after loading the view.
    }
    func setUpView()  {
        //from user defaults
        if userZodiac == nil {
            loadData(sunSign: UserDefaultsWrapper.manager.getZodiac()!)
         //from segue
        } else {
        zodiacSign.text = userZodiac.sunsign
        zodiacHoroscope.text = userZodiac.horoscope
        todaysDate.text = userZodiac.date
        }
    }
    
    func loadData(sunSign: String) {
        ZodiacAPIManager.shared.getZodiac(astroSign: sunSign){ (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let zodiacFromOnline):
                    self.userZodiac = zodiacFromOnline
                    self.zodiacSign.text = self.userZodiac.sunsign
                    self.zodiacHoroscope.text = self.userZodiac.horoscope
                    self.todaysDate.text = self.userZodiac.date
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
