//
//  SocialTableViewCell.swift
//  ms
//
//  Created by Neil Ballard on 6/18/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class SocialTableViewCell: UITableViewCell {
    
    @IBOutlet var socialImageView:UIImageView!
    
    var social:AnyObject?{
        didSet{
            self.setSocial()
            println("hello")
        }
    }
    
    func setSocial(){
        
        //self.headingLabel.text = "hello"
        // self.missedImageView.image = self.image1
        
        
    }

}
