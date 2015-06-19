//
//  GetMissed.swift
//  ms
//
//  Created by Neil Ballard on 6/15/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import Foundation


class GetMissed{
    
    func serverGet()
    {
        let urlPath = "http://99.999.9.97:8000/user/api/v1/user/?username=garfonzo@gmail.com&api_key=12345&format=json"
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
                    var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSDictionary
                    if let json = jsonResult as? Dictionary<String, AnyObject> {
                        let numSystems = json["objects"]!.count - 1
                        for index in 0...numSystems {
                            if let fname: AnyObject = json["objects"]![index]["fName"]! {
                                let firstName: String = fname as! String
                            }
                            if let instagram_: AnyObject = json["objects"]![index]["instagram"]! {
                                let instagram: String = instagram_ as! String
                            }
                            if let snapchat_: AnyObject = json["objects"]![index]["snapchat"]! {
                                let snapchat: String = snapchat_ as! String
                            }
                            if let linkedin_: AnyObject = json["objects"]![index]["linkedin"]! {
                                let linkedin: String = linkedin_ as! String
                            }
                            if let image0_: AnyObject = json["objects"]![index]["image0"]! {
                                let image0: String = image0_ as! String
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    
    
}