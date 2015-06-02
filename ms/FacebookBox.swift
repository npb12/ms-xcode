//
//  FacebookBox.swift
//  ms
//
//  Created by Neil Ballard on 5/21/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class FacebookBox: UIButton {

    
    
    let checkbox = UIImage(named: "checkbox") as UIImage?
    let checkedbox = UIImage(named: "checkedbox") as UIImage?
    
    
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
        self.isChecked = false
    }
    
    
    func buttonClicked(sender:UIButton){
        if(sender == self){
            if isChecked == true{
                isChecked = false
            }else{
                isChecked = true
            }
        }
        
        
    }
}
