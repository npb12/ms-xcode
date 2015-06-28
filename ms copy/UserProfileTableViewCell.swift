//
//  UserProfileTableViewCell.swift
//  ms
//
//  Created by Neil Ballard on 6/18/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class UserProfileTableViewCell: UITableViewCell {

    @IBOutlet var socialImageView:UIImageView!
    @IBOutlet var socialTextView:UITextView!


    
    var profile:AnyObject?{
        didSet{
          //  self.setSocial()
          //  println("hello")
        }
    }
    
    func setProfile(){
        
        //self.headingLabel.text = "hello"
        // self.missedImageView.image = self.image1
        
        
    }

}
