//
//  MissedTableViewCell.swift
//  ms
//
//  Created by Neil Ballard on 6/15/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class MissedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var outer_layer: UIView!
    
    @IBOutlet var headingLabel:UILabel!
    @IBOutlet var missedImageView:UIImageView!
    
    @IBOutlet weak var edit_button: UIButton!
    
    
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
    
    func applyPlainShadow(view: UIView) {
        var layer = view.layer
        
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 5
    }
    
    func applyCurvedShadow(view: UIView) {
        let size = view.bounds.size
        let width = size.width
        let height = size.height
        let depth = CGFloat(11.0)
        let lessDepth = 0.8 * depth
        let curvyness = CGFloat(5)
        let radius = CGFloat(1)
        
        var path = UIBezierPath()
        
        // top left
        path.moveToPoint(CGPoint(x: radius, y: height))
        
        // top right
        path.addLineToPoint(CGPoint(x: width - 2*radius, y: height))
        
        // bottom right + a little extra
        path.addLineToPoint(CGPoint(x: width - 2*radius, y: height + depth))
        
        // path to bottom left via curve
        path.addCurveToPoint(CGPoint(x: radius, y: height + depth),
            controlPoint1: CGPoint(x: width - curvyness, y: height + lessDepth - curvyness),
            controlPoint2: CGPoint(x: curvyness, y: height + lessDepth - curvyness))
        
        var layer = view.layer
        layer.shadowPath = path.CGPath
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = radius
        layer.shadowOffset = CGSize(width: 0, height: -3)
    }
    
    

    func applyHoverShadow(view: UIView) {
        let size = view.bounds.size
        let width = size.width
        let height = size.height
        
        var ovalRect = CGRect(x: 5, y: height + 5, width: width - 10, height: 15)
        var path = UIBezierPath(roundedRect: ovalRect, cornerRadius: 10)
        
        var layer = view.layer
        layer.shadowPath = path.CGPath
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
   
}
