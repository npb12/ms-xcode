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
    
    
    @IBOutlet weak var FBtextview: UITextView!
    @IBOutlet weak var Instagramtextfield: UITextField!
    @IBOutlet weak var Linkedintextfield: UITextField!
    @IBOutlet weak var Snapchattextfield: UITextField!
    


    var picture0 = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
          FBtextview.text = String(self.user.getName())
        
        
        self.picture0.addTarget(self, action: "picture0Tapped:", forControlEvents: UIControlEvents.TouchUpInside)
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
        println("button tapped!")
    }
    

    
    

    
        
        
        
        
    }
    
    
