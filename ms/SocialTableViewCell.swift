//
//  SocialTableViewCell.swift
//  ms
//
//  Created by Neil Ballard on 6/18/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class SocialTableViewCell: UITableViewCell {
    
    @IBOutlet weak var socialImageView: UIImageView!
    
    @IBOutlet weak var border: UIView!
    @IBOutlet weak var outer_layer: UIView!
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
    
    func applyPlainShadow() {
        var layer = outer_layer.layer
        
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 2
    }
    
    func applyPlainShadow2() {
        var layer = border.layer
        
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSize(width: 0, height: 0.5)
        layer.shadowOpacity = 0.05
        layer.shadowRadius = 0.05
    }

}
