//
//  LandingViewController.swift
//  ms
//
//  Created by Neil Ballard on 2/18/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import Foundation
import UIKit



class LandingViewController: UIViewController, FBLoginViewDelegate {
    
    
    @IBOutlet var fbLoginView : FBLoginView!
    
    
   override func viewDidAppear(animated: Bool) {
      //  let serverManagement = ServerManagement()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //serverManagement.serverGet()
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        
    }
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
        println("This is where you perform a segue.")
        self.updateUserLoggedInFlag()
        
        if var myToken = FBSession.activeSession().accessTokenData?.accessToken{
            
            let urlPath = "http://23.239.3.97:8000/user/app-registration/?access_token=\(myToken)"
            let url = NSURL(string: urlPath)
            
            let request = NSURLRequest(URL: url!)
            
            // Turns on activity spinner
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            
            // actually, we don't need the param since the access_token is already in the urlPath itself
            //var param = ["accessToken": myToken] as Dictionary
            
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { response, data, error in
                if let httpResponse = response as? NSHTTPURLResponse {
                    
                    println("The status code is: \(httpResponse.statusCode)")
                    // 200 status code means we have a good response
                    
                    if httpResponse.statusCode == 200 {
                        var err: NSError?
                        
                        println(httpResponse.statusCode)
                        
                        // here we capture what the server sends back, which should be the three items: userID, username, api_key
                        println("about to json")
                        var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSArray
                        println("and we jsoned")
                        
                        if let json = jsonResult[0] as? Dictionary<String, AnyObject> {
                            println(json)
                            println("you are here")
                            if let un: AnyObject = json["username"] {
                                if let uID: AnyObject = json["userID"] {
                                    if let api: AnyObject = json["api_key"] {
                                        let username: String = un as String
                                        println(username)
                                        let userID: String = uID as String
                                        println(userID)
                                        let api_key: String = api as String
                                        println(api_key)
                                        //
                                        // Now you have three variables from the server
                                        // and you can add them to user defaults
                                    }
                                    
                                }
                            }
                        }
                    }
                }
                
            }
            
            self.performSegueWithIdentifier("HomeViewController", sender: self)
        }
    }
        
        

    
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser){
        println("User Name: \(user.name)")
        
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
        self.updateUserLoggedOutFlag()
        
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func updateUserLoggedInFlag() {
    // Update the NSUserDefaults flag
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject("loggedIn", forKey: "userLoggedIn")
    defaults.synchronize()
    }
    
    func updateUserLoggedOutFlag() {
        // Update the NSUserDefaults flag
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(nil, forKey: "userLoggedIn")
        defaults.synchronize()
    }

}