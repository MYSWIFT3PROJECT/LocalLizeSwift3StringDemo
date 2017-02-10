//
//  LangaugeManager.swift
//  LocalLizableStringDemo
//
//  Created by ios Developer on 2/8/17.
//  Copyright © 2017 ios Developer. All rights reserved.
//

import Foundation
class LangaugeManager {
    static let shared = LangaugeManager()
    static let languageCode = "langaugeCode"
    var availablelocales : [Locale]
    private init(){
        let english = Locale(languageCode: "en", languageName: "English")
        let khmer = Locale(languageCode: "km", languageName: "Khmer")
        self.availablelocales = [english,khmer];
    }
    var language:Locale{
        set{
          let data = NSKeyedArchiver.archivedData(withRootObject: newValue)
        UserDefaults.standard.set(data, forKey:LangaugeManager.languageCode)
            UserDefaults.standard.synchronize()
        }
        
        get{
            var selectedLocale:Locale? = nil
            if let data = UserDefaults.standard.object(forKey: LangaugeManager.languageCode){
                let locale = NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! Locale
                let languageCode = locale.languageCode.lowercased()
                for locale in self.availablelocales{
                    if locale.languageCode.caseInsensitiveCompare(languageCode) == ComparisonResult.orderedSame{
                        selectedLocale = locale
                        break
                    }
                }
            }else{
                print("nil")
            }
            return selectedLocale!
        }
    }
    
}
extension String{
    var localized:String{
        get{
            if let data = UserDefaults.standard.object(forKey: LangaugeManager.languageCode){
                let locale = NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! Locale
                let languageCode = locale.languageCode.lowercased()
                let bundlePath = Bundle.main.path(forResource: languageCode, ofType: "lproj")
                let languageBundle = Bundle(path: bundlePath!)
                var translateString = languageBundle?.localizedString(forKey: self, value: "", table: nil)
                if (translateString?.characters.count)! < 1 {
                    translateString = NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: self, comment: self)
                }
                return translateString!
            }else{
                print("Nil")
            }
            return ""
        }
    }
}
