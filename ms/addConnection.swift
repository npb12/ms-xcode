//
//  addConnection.swift
//  ms
//
//  Created by Neil Ballard on 7/13/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import Foundation


class addConnection{
    
    let user = User()

    func sendInfo(other_userid: String, face: String, insta:String, link:String, snap:String){
    
    let urlPath = "http://99.999.999.97:8000/user/api/v1/location/?username=garfonzo&api_key=774ae5de0f08b8be5e02a37c2598b49337720e73&format=json"
    //let urlPath = "http://23.239.3.97:8000/user/api/v1/location/?username=garfonzo&api_key=774ae5de0f08b8be5e02a37c2598b49337720e73&format=json"
    let url = NSURL(string: urlPath)
    // The request needs to be 'Mutable' because we'll be attaching parameters to the POST request
    let request = NSMutableURLRequest(URL: url!)
    
    // All the variables to make up the POST params. I'm using static variables here, but
    // the lat and long should be the actual ones, caputed by the device
    // Change the newLat and newLong values to something that you will be able to recognize on the website. That way
    
    let userid = user.getUserID()
    var id = other_userid
    var facebook = face
    var instagram = insta
    var linkedin = link
    var snapchat = snap
    
    //println(userid)
    println(instagram)
    println(linkedin)
    println(snapchat)
    
    
    // Build a dictionary of all params
    /* userid needs to be added */
    var params = ["user_id": userid, "other_id": id, "facebook": facebook,"instagram": instagram, "linkedin": linkedin, "snapchat":snapchat] as Dictionary
    var err: NSError?
    
    // Assembling all the parts
    request.HTTPMethod = "POST"
    request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // This simply makes the network activity turn into a spinner, so that the user
    // can see that some sort of network activity is happening
    UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    
    // Last look at request we will send to Zeus
    //        println(request)
    //         println(request.HTTPBody)
    
    
    
    // This part actually sends the POST request as JSON data
    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { response, data, error in
        if let httpResponse = response as? NSHTTPURLResponse {
            // For testing, we want to see what code is returned. If it's something lik 401, then it's an authorization issue
            // or code 500 is internal server errors. We want to know what's coming back instead of silently failing.
            // We're aiming for the 2XX range, which is the success range. Like status code 201.
            //println("The status code is: \(httpResponse.statusCode)")
            
            
            
            
            // Turn off the "spinner" network activity indicator
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            
            
        }
        
    }
    
}



}