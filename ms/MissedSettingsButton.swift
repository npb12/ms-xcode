//
//  MissedSettingsButton.swift
//  ms
//
//  Created by Neil Ballard on 7/17/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class MissedSettingsButton: UIButton {

    let checkbox = UIImage(named: "uncheckmark") as UIImage?
    let checkedbox = UIImage(named: "checkmark") as UIImage?
    
    let defaults = NSUserDefaults.standardUserDefaults()
    let checkedBox: NSString = "checkedIt"
    
    
    
    
    var isChecked:Bool = true{
        didSet{
            println("is checked")
            if isChecked == true {
                self.setImage(checkedbox, forState: .Normal)
            }else{
                self.setImage(checkbox, forState: .Normal)
            }
        }
    }
    
    
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        if self.defaults.objectForKey("BoxSettings") == nil{
            self.isChecked = false
        }else{
            self.isChecked = true
        }
        
        
    }
    
    
    func buttonClicked(sender:UIButton){
        if(sender == self){
            if isChecked == true{
                isChecked = false
                self.defaults.setObject(nil , forKey: "BoxSettings")                
            }else{
                isChecked = true
                self.defaults.setObject(checkedBox, forKey: "BoxSettings")
            }
            self.defaults.synchronize()
        }
        
        
    }


}
