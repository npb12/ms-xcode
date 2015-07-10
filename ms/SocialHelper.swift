//
//  SocialHelper.swift
//  ms
//
//  Created by Neil Ballard on 7/9/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import Foundation


class SocialHelper{
    
    func fetchSocial(userid:String)
    {
        
        
        let urlPath = "http://89.432.3.97:8000/user/app-registration/?access_token=\(userid)"
        
        let url = NSURL(string: urlPath)
        
        let request = NSURLRequest(URL: url!)
        
        // Turns on activity spinner
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { response, data, error in
            if let httpResponse = response as? NSHTTPURLResponse {
                
                println("The status code is: \(httpResponse.statusCode)")
                // 200 status code means we have a good response
                
                if httpResponse.statusCode == 200 {
                    var err: NSError?
                    
                    println(httpResponse.statusCode)
                    
                    // here we capture what the server sends back, which should be the three items: userID, username, api_key
                    var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSArray
                    var social = [SocialModel] ()
                    
                    
                    
                    if let json = jsonResult[0] as? Dictionary<String, AnyObject> {
                        if let name: AnyObject = json["name"] {
                            if let uID: AnyObject = json["userID"] {
                                if let image: AnyObject = json["profile_picture"] {
                                    
                                    let username: String = name as! String
                                    //self.storeUserName(username)
                                    let userID: String = uID as! String
                                    //self.storeUserID(userID)
                                    let picture: String = image as! String
                                    
                                    
                                    //append
                                    
                                    let model = SocialModel(userid: userID, name: username, photo: picture)
                                    social.append(model)
                                    
                                    
                                }
                            }
                        }
                        
                        NSNotificationCenter.defaultCenter().postNotificationName("socialNotification", object: nil, userInfo: ["data":social])
                        
                    }
                    
                }
            }
            
        }
        
        
        
    }
    
    
    
    func fetchUserSocialInfo(userid:String)
    {
        
        let urlPath = "http://89.432.3.97:8000/user/app-registration/?access_token=\(userid)"
        
        let url = NSURL(string: urlPath)
        
        let request = NSURLRequest(URL: url!)
        
        // Turns on activity spinner
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { response, data, error in
            if let httpResponse = response as? NSHTTPURLResponse {
                
                println("The status code is: \(httpResponse.statusCode)")
                // 200 status code means we have a good response
                
                if httpResponse.statusCode == 200 {
                    var err: NSError?
                    
                    println(httpResponse.statusCode)
                    
                    // here we capture what the server sends back, which should be the three items: userID, username, api_key
                    var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSArray
                    
                    
                    if let json = jsonResult[0] as? Dictionary<String, AnyObject> {
                        if let fb: AnyObject = json["facebook"] {
                            if let insta: AnyObject = json["instagram"] {
                                if let link: AnyObject = json["linkedin"] {
                                    if let snap: AnyObject = json["snapchat"] {
                                        
                                        let facebook: String = fb as! String
                                        let instagram: String = insta as! String
                                        let linkedin: String = link as! String
                                        let snapchat: String = snap as! String
                                        
                                        let model = SocialInfoModel(facebook: facebook, instagram: instagram, linkedin: linkedin, snapchat: snapchat)
                                        
                                    }
                                }
                            }
                        }
                                      NSNotificationCenter.defaultCenter().postNotificationName("socialUserNotification", object: nil, userInfo: model)
                        
                    }
                    
                }
            }
            
        }
        
        
        
        
        
        
    }

    
    
    
    
    
    
    
    
}