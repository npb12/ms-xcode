//
//  FBsettings.swift
//  ms
//
//  Created by Neil Ballard on 6/28/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class FBsettings: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
        
        let fbcheckbox = UIImage(named: "checkbox") as UIImage?
        
        let fbcheckedbox = UIImage(named: "checkedbox") as UIImage?


        
        
    
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let checkedBox: NSString = "checkedIt"
        
        
        
        let mysocial = MySocialViewController()
        
        
        
        
        
        func settings()
            
        {
            
            if self.defaults.objectForKey("FacebookSettings") == nil{
                
                // self.setImage(fbcheckbox, forState: .Normal)
                
                self.setImage(fbcheckbox, forState: .Normal)
                
                //mysocial.setText()
                
            }else{
                
                self.setImage(fbcheckedbox, forState: .Normal)
                
                //mysocial.resetText()
                
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
                    
                    //  mysocial.resetText()
                    
                    
                    
                }else{
                    
                    isChecked = true
                    
                    self.defaults.setObject(checkedBox, forKey: "FacebookSettings")
                    
                    // mysocial.setText()
                    
                }
                
                self.defaults.synchronize()
                
            }
            
            
            
            
            
        }
        
        
        
    }
