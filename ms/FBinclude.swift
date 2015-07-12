//
//  FBinclude.swift
//  ms
//
//  Created by Neil Ballard on 7/9/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit
import Foundation

class FBinclude: UIButton {

    let fbcheckbox = UIImage(named: "checkmark") as UIImage?
    
    let fbcheckedbox = UIImage(named: "uncheckmark") as UIImage?
    
    let fbtextView = FBtextView()
    
    
    let mysocial = MySocialViewController()
    
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    let checkedBox: NSString = "checkedIt"
    
    
    
    
    
    
    
    func settings()
        
    {
        
        if self.defaults.objectForKey("FacebookSettings") == nil{
            
            // self.setImage(fbcheckbox, forState: .Normal)
            
            self.setImage(fbcheckbox, forState: .Normal)
            
            
            
        }else{
            
            self.setImage(fbcheckedbox, forState: .Normal)
            
            
            
        }
        
    }
    
    
    
    
    
    
    
    var isChecked:Bool = false{
        
        didSet{
            
            if isChecked == true {
                
                self.setImage(fbcheckedbox, forState: .Normal)
                
            }else{
                
                self.setImage(fbcheckbox, forState: .Normal)
                
            }
            
        }
        
    }
    
    
    
    
    
    override func awakeFromNib() {
        
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
        if self.defaults.objectForKey("FacebookSettings") == nil{
            
            self.isChecked = false
            
        }else{
            
            self.isChecked = true
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    func buttonClicked(sender:UIButton){
        
        if(sender == self){
            
            if isChecked == true{
                
                isChecked = false
                
                self.defaults.setObject(nil , forKey: "FacebookSettings")
                
                fbtextView.set_text_grey()

                
                
            }else{
                
                isChecked = true
                
                self.defaults.setObject(checkedBox, forKey: "FacebookSettings")
                fbtextView.set_text_black()

            }
            
            self.defaults.synchronize()
            
        }
        
        
        
        
        
    }
    
    
    

}
