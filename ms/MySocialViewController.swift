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
    let user = User()
    let user_server = UserServer()
    let albumviewcontroller = AlbumViewController()
 //   let fbsettings = FBsettings()
    let fb = FacebookBox()
    let insta = InstagramBox()
    let snap = SnapchatBox()
    let link = LinkedinBox()
    var sendServer = false
    
    var insta_text = ""
    var link_text = ""
    var snap_text = ""
    
    var insta_bool = false
    var link_bool = false
    var snap_bool = false
    
    /*
      logic -- 
          if server recieves "" text didn't change
          else if server recieves "delete_this_saved_field" text was removed; remove social network from list of networks
    
    
    */


    @IBOutlet weak var Snapchattextfield: UITextField!
    
    @IBOutlet weak var FBtextview: UITextView!
    
    @IBOutlet weak var Instagramtextfield: UITextField!

    @IBOutlet weak var Linkedintextfield: UITextField!


    @IBOutlet weak var picture0: UIButton!
    
    
    override func viewDidLoad() {
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let image0:UIImage = user.getImage0()

        
        picture0.setBackgroundImage(image0, forState: .Normal)

        
        
        FBtextview.text = String(self.user.getName())
        
        
        self.picture0.addTarget(self, action: "picture0Tapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
//        fbsettings.settings()
        fb.setBox()
        insta.setBox()
        snap.setBox()
        link.setBox()
        
        
        
        
        

      Instagramtextfield.delegate = self
        Linkedintextfield.delegate = self
        Snapchattextfield.delegate = self
        
        
        if (user.getInstagramName() != "") {
            Instagramtextfield.text = user.getInstagramName()
            insta_bool = true
            println("true")
        }
        
        if (user.getLinkedinName() != "") {
            Linkedintextfield.text = user.getLinkedinName()
            link_bool = true
            println("true")
        }
        
        if (user.getSnapchatName() != "") {
            Snapchattextfield.text = user.getSnapchatName()
            snap_bool = true
            println("true")
        }
        
        
        
     super.viewDidLoad()
        
    }
    
/*    func setText()
    {
        
        FBtextview.textColor = UIColor.lightGrayColor()
    }
    
    func resetText()
    {
        
        FBtextview.textColor = UIColor.blackColor()
    }
    */
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        
        
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
      if(self.Instagramtextfield.text != "")
        {
            user.setInstagramName(Instagramtextfield.text)
            //here 3
            sendServer = true
            insta_text = Instagramtextfield.text
        }else if(self.Instagramtextfield.text == "" && insta_bool){
        user.setInstagramName("")
        sendServer = true
        insta_text = "delete_this_saved_field"
        }
        
        if(self.Linkedintextfield.text != "")
        {
            user.setLinkedinURL(Linkedintextfield.text)
            sendServer = true
            link_text = Linkedintextfield.text
          }else if(self.Linkedintextfield.text == "" && link_bool){
            user.setLinkedinURL("")
            sendServer = true
            link_text = "delete_this_saved_field"
            println("ehlloas")
        }
        
        if(self.Snapchattextfield.text != "")
        {
            user.setSnapchatName(Snapchattextfield.text)
            //here 3
            sendServer = true
            snap_text = Snapchattextfield.text
        }else if(self.Snapchattextfield.text == "" && snap_bool){
            user.setSnapchatName("")
            sendServer = true
            snap_text = "delete_this_saved_field"
            println("ehllo")
            
        }
        
        if(sendServer)
        {
            println("sending info")
            self.user_server.sendInfo(insta_text, link: link_text, snap: snap_text)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        
        return true
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        if(textField == Instagramtextfield){
            animateViewMoving(true, moveValue: 300)
        }else if(textField == Linkedintextfield){
            animateViewMoving(true, moveValue: 300)
        }else if(textField == Snapchattextfield){
            animateViewMoving(true, moveValue: 300)
        }
        
    }
    func textFieldDidEndEditing(textField: UITextField) {
        if(textField == Instagramtextfield){
            animateViewMoving(true, moveValue: 300)
        }else if(textField == Linkedintextfield){
            animateViewMoving(true, moveValue: 300)
        }else if(textField == Snapchattextfield){
            animateViewMoving(true, moveValue: 300)
        }
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        var movementDuration:NSTimeInterval = 0.3
        var movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }
    
    
    
    
    
    
    
    func picture0Tapped(sender: UIButton!) {
        //albumviewcontroller.frames.frame = 0
        // println(albumviewcontroller.frame)
    }
    /*
    func picture1Tapped(sender: UIButton!) {
    albumviewcontroller.frames.frame
    // println(albumviewcontroller.frame)
    }
    
    func picture2Tapped(sender: UIButton!) {
    albumviewcontroller.frames.frame = 2
    // println(albumviewcontroller.frame)
    }
    
    func picture3Tapped(sender: UIButton!) {
    albumviewcontroller.frames.frame = 3
    //  println(albumviewcontroller.frame)
    }
    
    func picture4Tapped(sender: UIButton!) {
    albumviewcontroller.frames.frame = 4
    //  println(albumviewcontroller.frames.frame)
    }
    
    */
    
    
    
    
    
    
    
    
}

    