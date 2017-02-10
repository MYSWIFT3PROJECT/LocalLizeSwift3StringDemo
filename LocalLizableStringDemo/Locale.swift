//
//  Local.swift
//  LocalLizableStringDemo
//
//  Created by ios Developer on 2/8/17.
//  Copyright © 2017 ios Developer. All rights reserved.
//

import Foundation

class Locale:NSObject, NSCoding{
    var languageName: String
    var languageCode: String
    init(languageCode:String, languageName:String) {
        self.languageName = languageName
        self.languageCode = languageCode
    }
   public required init?(coder aCoder:NSCoder) {
        self.languageName = aCoder.decodeObject(forKey: "languageName") as! String
        self.languageCode = aCoder.decodeObject(forKey: "languageCode") as! String
    }
    public func encode(with aCoder:NSCoder){
       aCoder.encode(self.languageName, forKey: "languageName")
        aCoder.encode(self.languageCode, forKey: "languageCode")
    }

}
