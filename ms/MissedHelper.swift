//
//  MissedHelper.swift
//  ms
//
//  Created by Neil Ballard on 7/2/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import Foundation


class MissedHelper{
    
    func fetchMissed(userid:String)
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
                    var missed = [MissedModel] ()

                    
                    
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
                                    
                                    let model = MissedModel(userid: userID, name: username, photo: picture)
                                    missed.append(model)

                                    
                                }
                            }
                        }
                     
                        NSNotificationCenter.defaultCenter().postNotificationName("missedNotification", object: nil, userInfo: ["data":missed])
                        
                    }
                    
                }
            }
            
        }
        
        
        
    }
    
    
    func fetchUserMissedInfo(userid:String)
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
                        if let name: AnyObject = json["name"] {
                            if let photo: AnyObject = json["profile_picture"] {
                                if let fb: AnyObject = json["facebook"] {
                                    if let insta: AnyObject = json["instagram"] {
                                        if let link: AnyObject = json["linkedin"] {
                                            if let snap: AnyObject = json["snapchat"] {
                                    
                                                let username: String = name as! String
                                                let picture: String = photo as! String
                                                let facebook: String = fb as! String
                                                let instagram: String = insta as! String
                                                let linkedin: String = link as! String
                                                let snapchat: String = snap as! String
                                    
                                        let model = MissedInfoModel(userid: userid, name: username, photo: picture, facebook: facebook, instagram: instagram, linkedin: linkedin, snapchat: snapchat)
                                    
                                    }
                                }
                            }
                        }
                    }
                }
          //              NSNotificationCenter.defaultCenter().postNotificationName("missedUserNotification", object: nil, userInfo: model)
                        
                    }
                    
                }
            }
            
        }
        
        
        
        
        
        
    }

}