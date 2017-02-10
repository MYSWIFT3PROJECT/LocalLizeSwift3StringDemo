//
//  ViewController.swift
//  LocalLizableStringDemo
//
//  Created by ios Developer on 2/8/17.
//  Copyright © 2017 ios Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lable:UILabel!
    @IBOutlet weak var segmentLanguage:UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
        
    }
    @IBAction func changeLanguage(_ sender: UISegmentedControl){
        let languageManager = LangaugeManager.shared
        
        if sender.selectedSegmentIndex == 0 {
            let localeForRow = languageManager.availablelocales[0]
            languageManager.language = localeForRow
            print("Language selected:",localeForRow.languageName)
            
        }else if sender.selectedSegmentIndex == 1{
            let localeForRow = languageManager.availablelocales[1]
            languageManager.language = localeForRow
            print("Language selected:",localeForRow.languageName)
        }
        setController()
        
    }
    
    private func setController(){
        self.lable.text =  "Label".localized
        self.segmentLanguage.setTitle("English".localized, forSegmentAt: 0)
        self.segmentLanguage.setTitle("Khmer".localized, forSegmentAt: 1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}

