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
    let checkbox = UIImage(named: "checkbox") as UIImage?
    let checkedbox = UIImage(named: "checkedbox") as UIImage?
    var user = User()
    let albumviewcontroller = AlbumViewController()
    let fb = FacebookBox()
    let insta = InstagramBox()
    let snap = SnapchatBox()
    let link = LinkedinBox()

    

    
    
    @IBOutlet weak var FBtextview: UITextView!
    @IBOutlet weak var Instagramtextfield: UITextField!
    @IBOutlet weak var Linkedintextfield: UITextField!
    @IBOutlet weak var Snapchattextfield: UITextField!
    


    @IBOutlet weak var picture0: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let image0:UIImage = user.getImage0()

        
        picture0.setBackgroundImage(image0, forState: .Normal)

        
        
        FBtextview.text = String(self.user.getName())
        
        
        self.picture0.addTarget(self, action: "picture0Tapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
        

        
        fb.setBox()
        insta.setBox()
        snap.setBox()
        link.setBox()

        Instagramtextfield.delegate = self
        Linkedintextfield.delegate = self
        Snapchattextfield.delegate = self
        
        
        if defaults.objectForKey("instagram") != nil {
            Instagramtextfield.text = user.getInstagramName()
            
        }
        
        if defaults.objectForKey("linkedin") != nil {
            Linkedintextfield.text = user.getLinkedinName()
        }
        
        if defaults.objectForKey("snapchat") != nil {
            Snapchattextfield.text = user.getSnapchatName()
        }
        
        
        

    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)

      

        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if(self.Instagramtextfield.text != nil)
        {
            user.setInstagramName(Instagramtextfield.text)
        }
        
        if(self.Linkedintextfield.text != nil)
        {
            user.setLinkedinURL(Linkedintextfield.text)
        }
        
        if(self.Snapchattextfield.text != nil)
        {
            user.setSnapchatName(Snapchattextfield.text)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        
        return true
    }
    

    
    


    
    func picture0Tapped(sender: UIButton!) {
        //albumviewcontroller.frames.frame = 0
       // println(albumviewcontroller.frame)
    }

        
}
    
    
