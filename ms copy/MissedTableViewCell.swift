//
//  MissedTableViewCell.swift
//  ms
//
//  Created by Neil Ballard on 6/15/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class MissedTableViewCell: UITableViewCell {
    
    
    @IBOutlet var headingLabel:UILabel!
    @IBOutlet var missedImageView:UIImageView!
    
    var missed:AnyObject?{
        didSet{
            self.setMissed()
            println("hello")
        }
    }
    
    func setMissed(){
        
        //self.headingLabel.text = "hello"
       // self.missedImageView.image = self.image1
        
    
    }
   
}
