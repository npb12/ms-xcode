//
//  FBtextView.swift
//  ms
//
//  Created by Neil Ballard on 7/9/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class FBtextView: UITextView {

    
    let user = User()
    
    
    


    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.text = String(self.user.getName())
        
    }
    
    
    func set_text_grey()
    {
        self.textColor = UIColor.lightGrayColor()
    }
    
    
    
    func set_text_black()
        
    {
        
        self.textColor = UIColor.blackColor()
    }
    
    

    
    
    
    

    
    
}
