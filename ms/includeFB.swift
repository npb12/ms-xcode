//
//  includeFB.swift
//  ms
//
//  Created by Neil Ballard on 7/13/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//


import UIKit
import Foundation

class includeFB: UIButton {
    
    let fbcheckbox = UIImage(named: "uncheckmark") as UIImage?
    
    let fbcheckedbox = UIImage(named: "checkmark") as UIImage?
    
    //  let fbtextView = FBtextView()
    
    
    let mysocial = MySocialViewController()
    
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    let checkedBox: NSString = "checkedIt"
    
    
    
    
    
    
    
    func settings()
        
    {
        
        if self.defaults.stringForKey("FacebookSettings") == "unchecked"{
            
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
                println("ookkkkkk")
            }else{
                
                self.setImage(fbcheckbox, forState: .Normal)
                println("")
            }
            
        }
        
    }
    
    
    
    
    
    override func awakeFromNib() {
        
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
        if self.defaults.stringForKey("FacebookSettings") == "unchecked"{
            
            self.isChecked = false
            self.defaults.setObject("unchecked", forKey: "FacebookSettings")
            println("shouldn't be checked")
            
        }else if self.defaults.objectForKey("FacebookSettings") == nil{
            self.isChecked = true
            self.defaults.setObject(checkedBox, forKey: "FacebookSettings")
            println("ischecked")
        }
        else{
            self.isChecked = true
            self.defaults.setObject(checkedBox, forKey: "FacebookSettings")
            println("isssschecked")
        }
        
        
        
        
        
    }
    
    
    
    
    
    func buttonClicked(sender:UIButton){
        
        if(sender == self){
            
            if isChecked == true{
                
                isChecked = false
                
                self.defaults.setObject("unchecked" , forKey: "FacebookSettings")
                
                // fbtextView.set_text_grey()
                
            }else{
                
                isChecked = true
                
                self.defaults.setObject(checkedBox, forKey: "FacebookSettings")
                //     fbtextView.set_text_black()
                
            }
            
            self.defaults.synchronize()
            
        }
        
        
        
        
        
    }
    
    
    
    
}

