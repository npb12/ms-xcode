//
//  MySocialViewController.swift
//  ms
//
//  Created by Neil Ballard on 3/1/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import Foundation
import UIKit





class MySocialViewController: UIViewController, UITextFieldDelegate{
    
    var user = User()
    let albumviewcontroller = AlbumViewController()
    
    
    
    @IBOutlet weak var FBtextview: UITextView!
    @IBOutlet weak var Instagramtextfield: UITextField!
    @IBOutlet weak var Linkedintextfield: UITextField!
    @IBOutlet weak var Snapchattextfield: UITextField!
    


    @IBOutlet weak var picture0: UIButton!
    @IBOutlet weak var picture1: UIButton!
    @IBOutlet weak var picture2: UIButton!
    @IBOutlet weak var picture3: UIButton!
    @IBOutlet weak var picture4: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image:UIImage = user.getImage()
        println(image)
        
        picture0.setImage(image, forState: .Normal)
        
        
        FBtextview.text = String(self.user.getName())
        
        
        self.picture0.addTarget(self, action: "picture0Tapped:", forControlEvents: UIControlEvents.TouchUpInside)
         self.picture1.addTarget(self, action: "picture1Tapped:", forControlEvents: UIControlEvents.TouchUpInside)
         self.picture2.addTarget(self, action: "picture2Tapped:", forControlEvents: UIControlEvents.TouchUpInside)
         self.picture3.addTarget(self, action: "picture3Tapped:", forControlEvents: UIControlEvents.TouchUpInside)
         self.picture4.addTarget(self, action: "picture4Tapped:", forControlEvents: UIControlEvents.TouchUpInside)
        Instagramtextfield.delegate = self
        Linkedintextfield.delegate = self
        Snapchattextfield.delegate = self
        

    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)

      

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


    
    func picture0Tapped(sender: UIButton!) {
        albumviewcontroller.frame = 0
        println(albumviewcontroller.frame)
    }
    
    func picture1Tapped(sender: UIButton!) {
        albumviewcontroller.frame = 1
        println(albumviewcontroller.frame)
    }
    
    func picture2Tapped(sender: UIButton!) {
        albumviewcontroller.frame = 2
        println(albumviewcontroller.frame)
    }
    
    func picture3Tapped(sender: UIButton!) {
        albumviewcontroller.frame = 3
        println(albumviewcontroller.frame)
    }
    
    func picture4Tapped(sender: UIButton!) {
        albumviewcontroller.frame = 4
        println(albumviewcontroller.frame)
    }
    

    
    

    
        
        
        
        
    }
    
    
