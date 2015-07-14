//
//  ConnectionButton.swift
//  ms
//
//  Created by Neil Ballard on 7/13/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class ConnectionButton: UIButton {


    let add_button = UIImage(named: "add-button") as UIImage?
    let added_button = UIImage(named: "added-button") as UIImage?
    
    let defaults = NSUserDefaults.standardUserDefaults()
    let user_server = UserServer()
    
    
    
    
    
    var isChecked:Bool = true{
        didSet{
            println("is checked")
            if isChecked == true {
                self.setBackgroundImage(add_button, forState: .Normal)
            }else{
                self.setBackgroundImage(added_button, forState: .Normal)
            }
        }
    }
    
    
    override func awakeFromNib() {
        println("awakeNib")
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = true

    }
    
    
    func buttonClicked(sender:UIButton){
        if(sender == self){
            if isChecked == true{
                isChecked = false
            }
        }
        
        
    }

    
    
    
    

}
