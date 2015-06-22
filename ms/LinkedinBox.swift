//
//  LinkedinBox.swift
//  ms
//
//  Created by Neil Ballard on 5/21/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class LinkedinBox: UIButton {

    
    let checkbox = UIImage(named: "checkbox") as UIImage?
    let checkedbox = UIImage(named: "checkedbox") as UIImage?
    
    let defaults = NSUserDefaults.standardUserDefaults()
    let checkedBox: NSString = "checkedIt"
    
    
    func setBox()
    {
        if self.defaults.objectForKey("LinkedinCheckBox") == nil{
            self.setImage(checkbox, forState: .Normal)
            println("nooo")
        }else{
            self.setImage(checkedbox, forState: .Normal)
            println("yessss")
        }
    }
    
    
    
    var isChecked:Bool = false{
        didSet{
            if isChecked == true {
                self.setImage(checkedbox, forState: .Normal)
            }else{
                self.setImage(checkbox, forState: .Normal)
            }
        }
    }
    
    
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        if self.defaults.objectForKey("LinkedinCheckBox") == nil{
            self.isChecked = false
        }else{
            self.isChecked = true
        }
        
        
    }
    
    
    func buttonClicked(sender:UIButton){
        if(sender == self){
            if isChecked == true{
                isChecked = false
                self.defaults.setObject(nil , forKey: "LinkedinCheckBox")
                
            }else{
                isChecked = true
                self.defaults.setObject(checkedBox, forKey: "LinkedinCheckBox")
                
            }
            self.defaults.synchronize()
        }
        
        
    }

}
